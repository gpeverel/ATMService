package com.example.atmservice.controllers;

import com.example.atmservice.services.ATMMachineService;
import com.example.atmservice.services.WorkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class MainController {

	//private final ATMMachineService atmMachineService;

//	@GetMapping("/")
//	public String getMainPage(@RequestParam(name = "number", required = false) String number, Model model) {
//		model.addAttribute("machines", atmMachineService.listATMMachine(number));
//		return "mainPage";
//	}

}
