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

@Controller
@Slf4j
@RequiredArgsConstructor
public class LoginController {

	private final UserService userService;
	private final ClientService clientService;

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/registration")
	public String registration() {
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
		//log.info("CLIENT + USER {}", user);
		//client.setUser();
		clientService.saveClient(client);
		return "redirect:/login";
	}

	@GetMapping("/hello")
	public String securityUrl() {
		return "hello";
	}

}
