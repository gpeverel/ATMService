package com.example.atmservice.repositories;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.ApplicationForm;
import com.example.atmservice.models.Worker;
import com.example.atmservice.models.enums.ApplicationStatus;
import com.example.atmservice.models.enums.Qualification;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ApplicationRepository extends JpaRepository<ApplicationForm, Long> {

	List<ApplicationForm> findApplicationFormsByMachine(ATMMachine machine);

	List<ApplicationForm> findApplicationFormsByQualificationAndStatus(Qualification qualification, ApplicationStatus status);

	List<ApplicationForm> findApplicationFormsByWorkerAndStatus(Worker worker, ApplicationStatus status);

	List<ApplicationForm> findApplicationFormsByQualificationIsNull();
}
