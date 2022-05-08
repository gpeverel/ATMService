package com.example.atmservice.services;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.ApplicationForm;
import com.example.atmservice.models.enums.ApplicationStatus;
import com.example.atmservice.models.enums.Qualification;
import com.example.atmservice.repositories.ApplicationRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ApplicationService {
	private final ApplicationRepository appRepository;

	public void saveApplication(ApplicationForm application) {
		log.info("Saving new APP with date appearance: {}", application.getDateAppearance());
		appRepository.save(application);
	}

	public List<ApplicationForm> getFreeApplicationsByQualification(Qualification qualification) {
		return appRepository.findApplicationFormsByQualificationAndStatus(qualification, ApplicationStatus.FREE);
	}

	public List<ApplicationForm> getApplicationsByMachine(ATMMachine machine) {
		return appRepository.findApplicationFormsByMachine(machine);
	}

	public ApplicationForm getApplicationsById(Long id) {
		return appRepository.findById(id).orElse(null);
	}

}
