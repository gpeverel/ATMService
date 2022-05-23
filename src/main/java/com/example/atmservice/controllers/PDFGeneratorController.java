package com.example.atmservice.controllers;

import com.example.atmservice.services.ATMMachineService;
import com.example.atmservice.services.PDFGeneratorService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;

@Controller
@AllArgsConstructor
public class PDFGeneratorController {

	private final PDFGeneratorService pdfService;
	private final ATMMachineService machineService;

	@GetMapping("/pdf/generate")
	public void generatePDF(HttpServletResponse response, Principal principal) throws IOException {
		response.setContentType("application/pdf; charset=UTF-8");

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=Report_" + LocalDateTime.now() + ".pdf";
		response.setHeader(headerKey, headerValue);
		pdfService.exportReportOnATM(response, machineService.getClientByPrincipal(principal));
	}

}
