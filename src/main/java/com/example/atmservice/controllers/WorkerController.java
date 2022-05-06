package com.example.atmservice.controllers;

import com.example.atmservice.models.Worker;
import com.example.atmservice.services.WorkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class WorkerController {

	private final WorkerService workerService;

	@GetMapping("/worker")
	public String getMainWorkerPage(Principal principal, Model model) {
		Worker worker = workerService.getWorkerByPrincipal(principal);
		model.addAttribute("worker", worker);
		//TODO сюда добавлять список заявок
		return "workerMainPage";
	}




}
