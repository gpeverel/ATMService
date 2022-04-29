package com.example.atmservice.controllers;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.services.ATMMachineService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class AtmMachineController {
	private final ATMMachineService machineService;


	@GetMapping("/machine/{id}")
	public String machineInfo(@PathVariable Long id, Model model) {
		model.addAttribute("machine", machineService.getAtmMachineById(id));
		return "machine-info";
	}

	@PostMapping("/machine/create")
	public String createMachine(ATMMachine machine) {
		machineService.saveATMMachine(machine);
		return "redirect:/";
	}

	@PostMapping("/machine/delete/{id}")
	public String deleteMachine(@PathVariable Long id) {
		machineService.deleteATMMachine(id);
		return "redirect:/";
	}

}
