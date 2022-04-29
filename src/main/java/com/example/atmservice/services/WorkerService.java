package com.example.atmservice.services;

import com.example.atmservice.models.Worker;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class WorkerService {
	private List<Worker> workers = new ArrayList<>();
	private long ID = 0;

	{
		workers.add(new Worker(++ID, "first", "1234", "name", "high"));
		workers.add(new Worker(++ID, "second", "1234", "name", "high"));
		workers.add(new Worker(++ID, "third", "1234", "name", "high"));
	}

	public List<Worker> listWorkers() {
		return workers;
	}

	public void saveWorker(Worker worker) {
		worker.setId(++ID);
		workers.add(worker);
	}

	public void deleteWorker(Long id) {
		workers.removeIf(worker -> worker.getId().equals(id));
	}
}
