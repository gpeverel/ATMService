package com.example.atmservice.repositories;

import com.example.atmservice.models.ATMMachine;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ATMMachineRepository extends JpaRepository<ATMMachine, Long> {
	List<ATMMachine> findATMMachineByNumber(String number);

	//List<ATMMachine> getAll();
	List<ATMMachine> findATMMachineByClientId(Long id);
}
