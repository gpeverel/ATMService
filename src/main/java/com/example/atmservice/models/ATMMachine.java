package com.example.atmservice.models;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ATMMachine {
	private Long id;
	private String number;
	private String location;
	private String model;
	//private Long company_id;

}
