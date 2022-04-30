package com.example.atmservice.repositories;

import com.example.atmservice.models.Client;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClientRepository extends JpaRepository<Client, Long> {


}
