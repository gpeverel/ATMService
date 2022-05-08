package com.example.atmservice.controllers;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.ApplicationForm;
import com.example.atmservice.models.enums.Qualification;
import com.example.atmservice.services.ATMMachineService;
import com.example.atmservice.services.ApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationController {

	private final ATMMachineService atmMachineService;
	private final ApplicationService applicationService;

	@PostMapping("/application/create")
	public String createApplication(String description, Qualification qualification,
	                                Long machineId) {
		ATMMachine machine = atmMachineService.getAtmMachineById(machineId);
		ApplicationForm application = new ApplicationForm(machine);
		application.setDescription(description);
		application.setQualification(qualification);
		application.setType("client");
		applicationService.saveApplication(application);
		return "redirect:/machine/" + machineId;
	}

	@GetMapping("/application/{id}")
	public String applicationInfo(@PathVariable Long id, Model model) {
		ApplicationForm app = applicationService.getApplicationsById(id);
		model.addAttribute("app", app);
		return "application-info";
	}




}
