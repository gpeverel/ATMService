package com.example.atmservice.controllers;

import com.example.atmservice.models.Client;
import com.example.atmservice.models.User;
import com.example.atmservice.models.enums.Role;
import com.example.atmservice.services.ATMMachineService;
import com.example.atmservice.services.ClientService;
import com.example.atmservice.services.UserService;
import com.example.atmservice.services.WorkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final ClientService clientService;
	private final UserService userService;
	private final ATMMachineService machineService;

	@GetMapping("/")
	public String getMainPageForUser(Principal principal) {
		User user = userService.getUserByLogin(principal.getName());
		if (user.getRoles().contains(Role.ROLE_CLIENT)) {
			return "redirect:/client";
		}
		else if (user.getRoles().contains(Role.ROLE_ADMIN)) {
			return "redirect:/admin";
		}
		else if (user.getRoles().contains(Role.ROLE_WORKER)) {
			return "redirect:/worker";
		}
		return "redirect:/";
	}

}
