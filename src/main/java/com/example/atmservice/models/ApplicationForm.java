package com.example.atmservice.models;

import com.example.atmservice.models.enums.ApplicationStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "application")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApplicationForm {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	/** тип зависит от того, кто оставил заявку, банкомат или клиент */
	private String type;
	private String description;
	/** Дата взятия заявки сотрудником */
	private LocalDateTime dateBegin;
	/** Дата окончания работы */
	private LocalDateTime dateEnd;
	/** Дата появления заявки */
	private LocalDateTime dateAppearance;
	/** Статус заявки может быть: Free, Busy, Done */
	private ApplicationStatus status;
	private String qualification;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "workerId")
	private Worker worker;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "machineId")
	private ATMMachine machine;

	public ApplicationForm(ATMMachine machine) {
		this.machine = machine;
		status = ApplicationStatus.FREE;
		dateAppearance = LocalDateTime.now();
	}

}
