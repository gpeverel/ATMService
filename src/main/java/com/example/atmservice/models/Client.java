package com.example.atmservice.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "client")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Client {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String login;
	private String password;
	private String title;

	// cascade.ALL при удалении клиента - удаляем все его банкоматы, при сохранении так же сохраняет его банкоматы
	// fetch.LAZY чтобы не подгружать все банкоматы
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
	mappedBy = "client")
	private List<ATMMachine> machines = new ArrayList<>();

	public void addAtmMachineToClient(ATMMachine machine) {
		machine.setClient(this);
		machines.add(machine);
	}

}
