package com.example.atmservice.controllers;

import com.example.atmservice.models.Worker;
import com.example.atmservice.services.ApplicationService;
import com.example.atmservice.services.WorkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class WorkerController {

	private final WorkerService workerService;
	private final ApplicationService appService;

	@GetMapping("/worker")
	public String getMainWorkerPage(@RequestParam(name = "search", required = false) boolean search,
	                                Principal principal, Model model) {
		Worker worker = workerService.getWorkerByPrincipal(principal);
		model.addAttribute("worker", worker);
		if (search == true) {
			model.addAttribute("freeApps",
					appService.getFreeApplicationsByQualification(worker.getQualification()));
		}
		//TODO сюда добавлять список заявок
		return "workerMainPage";
	}




}
