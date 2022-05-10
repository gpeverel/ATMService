package com.example.atmservice.services;

import com.example.atmservice.models.Client;
import com.example.atmservice.models.User;
import com.example.atmservice.models.Worker;
import com.example.atmservice.repositories.UserRepository;
import com.example.atmservice.repositories.WorkerRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class WorkerService {
	private final WorkerRepository workerRepository;
	private final UserRepository userRepository;

	public List<Worker> getWorkers() {
		return workerRepository.findAll();
	}

	public void saveWorker(Worker worker) {
		log.info("Saving new worker with fullName: {}", worker.getFullName());
		workerRepository.save(worker);
	}

	public void deleteWorker(Long id) {
		workerRepository.deleteById(id);
	}

	public Worker getWorkerByPrincipal(Principal principal) {
		if (principal == null) {
			return new Worker(); // чтобы сравнивать с null во freeMarker-e
		}
		User user = userRepository.findByLogin(principal.getName());
		return workerRepository.findById(user.getId()).orElse(new Worker());
	}

	public Worker getWorkerById(Long workerId) {
		return workerRepository.findById(workerId).orElse(null);
	}
}
