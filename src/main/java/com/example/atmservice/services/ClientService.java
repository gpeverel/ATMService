package com.example.atmservice.services;

import com.example.atmservice.models.Client;
import com.example.atmservice.repositories.ClientRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class ClientService {
	private final ClientRepository clientRepository;

	public void saveClient(Client client) {
		log.info("Saving new client with title: {}", client.getTitle());
		clientRepository.save(client);
	}

	public void deleteClient(Long id) {
		clientRepository.deleteById(id);
	}

	public Client getClientById(Long id) {
		return clientRepository.findById(id).orElse(null);
	}

}
