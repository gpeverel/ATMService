package com.example.atmservice.controllers;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.ApplicationForm;
import com.example.atmservice.models.Worker;
import com.example.atmservice.models.enums.ApplicationStatus;
import com.example.atmservice.models.enums.Qualification;
import com.example.atmservice.services.ATMMachineService;
import com.example.atmservice.services.ApplicationService;
import com.example.atmservice.services.WorkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationController {

	private final ATMMachineService atmMachineService;
	private final ApplicationService applicationService;
	private final WorkerService workerService;

	@PostMapping("/application/create")
	public String createApplication(String description, Long machineId) {
		ATMMachine machine = atmMachineService.getAtmMachineById(machineId);
		ApplicationForm application = new ApplicationForm(machine);
		application.setDescription(description);
		application.setType("client");
		applicationService.saveApplication(application);
		return "redirect:/machine/" + machineId;
	}

	@GetMapping("/application/{id}")
	public String applicationInfo(Principal principal, @PathVariable Long id, Model model) {
		ApplicationForm app = applicationService.getApplicationsById(id);
		Worker worker = workerService.getWorkerByPrincipal(principal);
		model.addAttribute("app", app);
		model.addAttribute("worker", worker);
		return "application-info";
	}

	@PostMapping("/application/busy")
	public String giveApplicationToWorker(Long appId, Long workerId) {
		ApplicationForm application = applicationService.getApplicationsById(appId);
		Worker worker = workerService.getWorkerById(workerId);
		application.setWorker(worker);
		application.setStatus(ApplicationStatus.BUSY);
		application.setDateBegin(LocalDateTime.now());
		applicationService.saveApplication(application);
		return "redirect:/";
	}

	@PostMapping("/application/update/qualification")
	public String updateQualificationByAdmin(Long appId, Qualification qualification) {
		ApplicationForm application = applicationService.getApplicationsById(appId);
		application.setStatus(ApplicationStatus.FREE);
		application.setQualification(qualification);
		applicationService.saveApplication(application);
		return "redirect:/";
	}

	@PostMapping("/application/done")
	public String completeExecutionOfApplicationByWorker(Long appId) {
		ApplicationForm application = applicationService.getApplicationsById(appId);
		application.setStatus(ApplicationStatus.DONE);
		application.setDateEnd(LocalDateTime.now());
		applicationService.saveApplication(application);
		return "redirect:/";
	}

}
