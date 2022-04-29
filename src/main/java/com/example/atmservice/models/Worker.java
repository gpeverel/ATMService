package com.example.atmservice.models;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Worker {
	private Long id;
	private String login;
	private String password;
	private String fullName;
	private String qualification;

}
