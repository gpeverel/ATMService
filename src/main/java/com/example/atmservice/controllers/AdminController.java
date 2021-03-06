package com.example.atmservice.controllers;

import com.example.atmservice.models.enums.Qualification;
import com.example.atmservice.services.ApplicationService;
import com.example.atmservice.services.ClientService;
import com.example.atmservice.services.UserService;
import com.example.atmservice.services.WorkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
	private final UserService userService;
	private final ClientService clientService;
	private final WorkerService workerService;
	private final ApplicationService appService;

	@GetMapping("/admin")
	public String admin(Model model) {
		model.addAttribute("clients", clientService.getClients());
		model.addAttribute("workers", workerService.getWorkers());
		model.addAttribute("qualifications", List.of(Qualification.values()));
		model.addAttribute("newApps", appService.getApplicationsWithoutQualification());
		return "admin";
	}

	@PostMapping("/admin/user/activate/{id}")
	public String userBanOrActivate(@PathVariable("id") Long id) {
		userService.activateOrBanUser(id);
		return "redirect:/admin";
	}

}
