package com.example.atmservice.controllers;

import com.example.atmservice.models.Client;
import com.example.atmservice.models.User;
import com.example.atmservice.models.enums.Role;
import com.example.atmservice.services.ClientService;
import com.example.atmservice.services.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class LoginController {

	private final UserService userService;
	private final ClientService clientService;

	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
			model.addAttribute("error", true);
		}
		else {
			model.addAttribute("error", false);
		}
		return "login";
	}

	@GetMapping("/registration")
	public String registration(Model model) {
		User user = userService.getUserByRole(Role.ROLE_ADMIN);
		if (user != null) {
			model.addAttribute("thereIsAdmin", true);
		}
		else {
			model.addAttribute("thereIsAdmin", false);
		}
		return "registration";
	}

	@GetMapping("/registration/client")
	public String registrationClient() {
		return "registrationClient";
	}

	@PostMapping("/registration/client")
	public String createClient(User user, String title, Model model) {
		log.info("NEW USER {}", user);
		if (!userService.createUser(user, Role.ROLE_CLIENT)) {
			model.addAttribute("errorMessage", "Пользователь с таким логином уже существует!");
		}
		Client client = new Client(userService.getUserByLogin(user.getLogin()));
		client.setTitle(title);
		clientService.saveClient(client);
		return "redirect:/login";
	}

	@GetMapping("/registration/admin")
	public String registrationAdmin() {
		return "registrationAdmin";
	}

	@PostMapping("/registration/admin")
	public String createAdmin(User user, Model model) {
		log.info("NEW ADMIN {}", user);
		if (!userService.createUser(user, Role.ROLE_ADMIN)) {
			model.addAttribute("errorMessage", "Пользователь с таким логином уже существует!");
		}
		return "redirect:/login";
	}

	@GetMapping("/hello")
	public String securityUrl() {
		return "hello";
	}

}
