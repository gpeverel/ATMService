package com.example.atmservice.services;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.ApplicationForm;
import com.example.atmservice.models.Client;
import com.example.atmservice.models.Worker;
import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfWriter;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Service
@AllArgsConstructor
public class PDFGeneratorService {

	private final ATMMachineService machineService;
	private final ApplicationService applicationService;



	public void exportReportOnATM(HttpServletResponse response, Client client) throws IOException {
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());
		document.open();
		//FontFactory.register("src/main/resources/static/font/TimesNewRoman.ttf", "TNV");
		Font fontTitle = FontFactory.getFont("", 14);
		Font fontNormal = FontFactory.getFont("", 13);

		Paragraph paragraphTitle = new Paragraph("Отчет для организации " + client.getTitle(),
				fontTitle);
		paragraphTitle.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(paragraphTitle);

		List<ATMMachine> visibleMachines = machineService.getVisibleATMMachinesByClientId(client.getId());

		for (ATMMachine machine : visibleMachines) {
			document.add(getATMDescriptionParagraph(machine, fontTitle));
			List<ApplicationForm> machineApplications = applicationService.getApplicationsByMachine(machine);
			for (ApplicationForm application : machineApplications) {
				document.add(getApplicationDescriptionParagraph(application, fontNormal));
			}
		}
		Paragraph paragraphDeletedMachinesTitle = new Paragraph("\nУдаленные банкоматы", fontTitle);
		paragraphDeletedMachinesTitle.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(paragraphDeletedMachinesTitle);
		List<ATMMachine> deletedMachines = machineService.getDeletedATMMachinesByClientId(client.getId());
		for (ATMMachine machine : deletedMachines) {
			document.add(getATMDescriptionParagraph(machine, fontTitle));
			List<ApplicationForm> machineApplications = applicationService.getApplicationsByMachine(machine);
			for (ApplicationForm application : machineApplications) {
				document.add(getApplicationDescriptionParagraph(application, fontNormal));
			}
		}
		document.close();



	}

	private Paragraph getApplicationDescriptionParagraph(ApplicationForm application, Font font) {
		String dateBegin;
		String dateEnd;
		String qualification;
		String status;
		String workerStr;
		if (application.getDateBegin() == null) {
			dateBegin = "Отсутствует";
		}
		else {
			dateBegin = application.getDateBegin().toString();
		}
		if (application.getDateEnd() == null) {
			dateEnd = "Отсутствует";
		}
		else {
			dateEnd = application.getDateEnd().toString();
		}
		if (application.getQualification() == null) {
			qualification = "Появится после подтверждения администратором";
		}
		else {
			qualification = application.getQualification().name();
		}
		switch (application.getStatus()) {
			case FREE: status = "ожидается сотрудник"; break;
			case BUSY: status = "сотрудник взял заявку"; break;
			case DONE: status = "заявка выполнена"; break;
			case NOT_CONFIGURED: status = "ожидается подтверждение от администратора"; break;
			default: status = "не определен";
		}
		Worker worker = application.getWorker();
		if (application.getWorker() == null) {
			workerStr = "еще не назначен";
		}
		else {
			workerStr = worker.getFullName();
		}
		Paragraph paragraph = new Paragraph(
				String.format("      Заявка типа: %s, квалификация: %s, описание заявки: %s, статус: %s.\n" +
								"Дата появления заявки: %s; Дата начала работы: %s; Дата окончания работы: %s.\n" +
								"Сотрудник: %s.\n",
						application.getType(), qualification, application.getDescription(), status,
						application.getDateAppearance().toString(), dateBegin, dateEnd, workerStr),
				font);
		paragraph.setAlignment(Paragraph.ALIGN_LEFT);
		return paragraph;


	}

	private Paragraph getATMDescriptionParagraph(ATMMachine machine, Font font) {
		Paragraph paragraph = new Paragraph(
				String.format("Список заявок для банкомата модели: %s, номера: %s, по адресу %s",
						machine.getModel(), machine.getNumber(), machine.getLocation()),
				font);
		paragraph.setAlignment(Paragraph.ALIGN_LEFT);
		return paragraph;
	}

}
