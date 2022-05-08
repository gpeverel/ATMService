package com.example.atmservice.controllers;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.ApplicationForm;
import com.example.atmservice.services.ATMMachineService;
import com.example.atmservice.services.ApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class ApplicationController {

	private final ATMMachineService atmMachineService;
	private final ApplicationService applicationService;

	@PostMapping("/application/create")
	public String createApplication(String description, String qualification,
	                                Long machineId) {
		ATMMachine machine = atmMachineService.getAtmMachineById(machineId);
		ApplicationForm application = new ApplicationForm(machine);
		application.setDescription(description);
		application.setQualification(qualification);
		application.setType("client");
		applicationService.saveApplication(application);
		return "redirect:/machine/" + machineId;
	}




}
