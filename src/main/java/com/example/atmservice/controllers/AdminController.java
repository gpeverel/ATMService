package com.example.atmservice.controllers;

import com.example.atmservice.services.ClientService;
import com.example.atmservice.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
	private final UserService userService;
	private final ClientService clientService;

	@GetMapping("/admin")
	public String admin(Model model) {
		model.addAttribute("clients", clientService.getClients());
		return "admin";
	}

	@PostMapping("/admin/user/activate/{id}")
	public String userBanOrActivate(@PathVariable("id") Long id) {
		userService.activateOrBanUser(id);
		return "redirect:/admin";
	}

}
