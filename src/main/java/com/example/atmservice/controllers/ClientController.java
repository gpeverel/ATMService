package com.example.atmservice.controllers;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.Client;
import com.example.atmservice.services.ATMMachineService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ClientController {

	private final ATMMachineService machineService;

	@GetMapping("/client")
	public String getMainClientPage(/*@RequestParam(name = "number", required = false) String number,*/
	                          Principal principal, Model model) {
		Client client = machineService.getClientByPrincipal(principal);
		model.addAttribute("client", client);
		model.addAttribute("machines", client.getMachines() /*machineService.listATMMachine(number)*/);
		return "clientMainPage";
	}

	@GetMapping("/machine/{id}")
	public String machineInfo(@PathVariable Long id, Model model) {
		model.addAttribute("machine", machineService.getAtmMachineById(id));
		return "machine-info";
	}

	@PostMapping("/machine/create")
	public String createMachine(ATMMachine machine, Principal principal) {
		machineService.saveATMMachine(principal, machine);
		return "redirect:/client";
	}

	@PostMapping("/machine/delete/{id}")
	public String deleteMachine(@PathVariable Long id) {
		machineService.deleteATMMachine(id);
		return "redirect:/client";
	}

}
