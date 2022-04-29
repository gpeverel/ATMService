package com.example.atmservice.controllers;

import com.example.atmservice.services.ATMMachineService;
import com.example.atmservice.services.WorkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final ATMMachineService atmMachineService;

	@GetMapping("/")
	public String getMainPage(Model model) {
		model.addAttribute("machines", atmMachineService.listATMMachine());
		return "mainPage";
	}

}
