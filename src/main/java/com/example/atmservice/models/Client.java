package com.example.atmservice.models;

import com.example.atmservice.models.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "client")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Client {

	@Id
	private Long id;

	private String title;

	// cascade.ALL при удалении клиента - удаляем все его банкоматы, при сохранении так же сохраняет его банкоматы
	// fetch.LAZY чтобы не подгружать все банкоматы
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,
	mappedBy = "client")
	private List<ATMMachine> machines = new ArrayList<>();

	@OneToOne(cascade = CascadeType.ALL)
	@MapsId // так как каждому клиенту всегда соответствует свой юзер, сделаем чтобы внешний ключ был еще и первичным ключом
	@JoinColumn(name = "id")
	private User user;

	public Client(User user) {
		this.user = user;
	}

//	public void addAtmMachineToClient(ATMMachine machine) {
//		machine.setClient(this);
//		machines.add(machine);
//	}

}
