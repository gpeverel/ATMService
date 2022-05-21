package com.example.atmservice.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "machine")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ATMMachine {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String number;
	private String location;
	private String model;
	private boolean visible;

	/**
	 * cascade - Как повлияет изменение сущности Банкомат на сущность Клиент (REFRESH - обновит его)
	 * fetch - способ загрузки привязанных сущностей (EAGER - подгружаем все связанные с ней сущности)
	 */
	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@JoinColumn
	private Client client;

}
