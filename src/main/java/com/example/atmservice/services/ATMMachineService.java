package com.example.atmservice.services;

import com.example.atmservice.models.ATMMachine;
import com.example.atmservice.models.Client;
import com.example.atmservice.models.User;
import com.example.atmservice.repositories.ATMMachineRepository;
import com.example.atmservice.repositories.ClientRepository;
import com.example.atmservice.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ATMMachineService {
	private final ATMMachineRepository machineRepository;
	private final UserRepository userRepository;
	private final ClientRepository clientRepository;

	public List<ATMMachine> listATMMachine(String number) {
		if (number != null) {
			return machineRepository.findATMMachineByNumber(number);
		}
		return machineRepository.findAll();
	}

	//TODO добавить к банкомату клиента при сохранении
	public void saveATMMachine(Principal principal, ATMMachine atmMachine) {
		atmMachine.setClient(getClientByPrincipal(principal));
		log.info("Saving new {}", atmMachine);
		machineRepository.save(atmMachine);
	}

	public Client getClientByPrincipal(Principal principal) {
		if (principal == null) {
			return new Client(); // хз для чего это
		}
		User user = userRepository.findByLogin(principal.getName());
		return clientRepository.findById(user.getId()).get();
	}

	public void deleteATMMachine(Long id) {
		machineRepository.deleteById(id);
	}

	public ATMMachine getAtmMachineById(Long id) {
		return machineRepository.findById(id).orElse(null);
	}

}
