package com.example.atmservice.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "worker")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Worker {
	@Id
	private Long id;
	private String fullName;
	private String qualification;

	@OneToOne(cascade = CascadeType.ALL)
	@MapsId // так как каждому работнику всегда соответствует свой юзер, сделаем чтобы внешний ключ был еще и первичным ключом
	@JoinColumn(name = "id")
	private User user;

	public Worker(User user) {
		this.user = user;
	}

}
