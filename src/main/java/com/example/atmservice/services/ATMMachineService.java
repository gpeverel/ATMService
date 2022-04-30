package com.example.atmservice.services;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.repositories.ATMMachineRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ATMMachineService {
	private final ATMMachineRepository machineRepository;

	public List<ATMMachine> listATMMachine(String number) {
		if (number != null) {
			return machineRepository.findATMMachineByNumber(number);
		}
		return machineRepository.findAll();
	}

	//TODO добавить к банкомату клиента при сохранении
	public void saveATMMachine(ATMMachine atmMachine) {
		log.info("Saving new {}", atmMachine);
		machineRepository.save(atmMachine);
	}

	public void deleteATMMachine(Long id) {
		machineRepository.deleteById(id);
	}

	public ATMMachine getAtmMachineById(Long id) {
		return machineRepository.findById(id).orElse(null);
	}

}
