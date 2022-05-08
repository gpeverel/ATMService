package com.example.atmservice.repositories;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.ApplicationForm;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ApplicationRepository extends JpaRepository<ApplicationForm, Long> {

	List<ApplicationForm> findApplicationFormsByMachine(ATMMachine machine);

}
