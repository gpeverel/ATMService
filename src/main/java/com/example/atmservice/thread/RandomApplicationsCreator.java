package com.example.atmservice.thread;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.ApplicationForm;
import com.example.atmservice.models.enums.ApplicationStatus;
import com.example.atmservice.models.enums.Qualification;
import com.example.atmservice.services.ATMMachineService;
import com.example.atmservice.services.ApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Component
//@Service
@RequiredArgsConstructor
public class RandomApplicationsCreator implements CommandLineRunner /*extends Thread*/ {

	private final ATMMachineService machineService;
	private final ApplicationService applicationService;

	private Qualification qualificationByDescription;
	private final String[] descriptionArray = {
			"Низкое количество купюр в банкомате.",
			"Низкое количество бумаги для печати чека.",
			"Повреждена система сортировки купюр.",
			"Восстановление сетевого (коммуникационного) соединения устройства.",
			"Устранение замятий в трактах чекового и журнального принтеров.",
			"Восстановление электрического соединения устройства с сетью, решение" +
					" проблем с подключением в точке установки.",
			"Переустановка и настройка ПО в целях восстановления работоспособности банкомата.",
			"Требуется заменить изношенные детали банкомата.",
			"Неизвестная неисправность. Требуется провести анализ повреждения.",
	};

	@Override
	public void run(String... args) {
		System.out.println("Поток начал работу!");
		try {
			while (true) {
				Thread.sleep(60000);
				List<ATMMachine> machineList = machineService.getVisibleATMMachines();
				if (machineList.size() == 0) {
					System.out.println("Банкоматов нет!");
					continue;
				}
				int randomATMNumber = (int) ((Math.random() * machineList.size()));
				System.out.println("Случайный индекс банкомата в списке: " + randomATMNumber);
				ApplicationForm application = createRandomApplication(machineList.get(randomATMNumber));
				System.out.println("Новая заявка типа: " + application.getType() +
						" для банкомата модели : " + application.getMachine().getModel());
				applicationService.saveApplication(application);
			}
		}
		catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	public ApplicationForm createRandomApplication(ATMMachine machine) {
		ApplicationForm application = new ApplicationForm(machine);
		application.setDescription(getRandomDescription());
		application.setQualification(qualificationByDescription);
		application.setDateAppearance(LocalDateTime.now());
		application.setStatus(ApplicationStatus.FREE);
		application.setType("ATM");
		return application;
	}

	private String getRandomDescription() {
		int randomDescriptionNumber = (int) ((Math.random() * descriptionArray.length));
		System.out.println("Случайный индекс описания банкомата в списке: " + randomDescriptionNumber);
		qualificationByDescription = Qualification.values()[randomDescriptionNumber % 3];
		System.out.println("Квалификация по описанию: " + qualificationByDescription);
		return descriptionArray[randomDescriptionNumber];
	}


}
