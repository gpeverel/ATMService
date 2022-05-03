package com.example.atmservice.repositories;

import com.example.atmservice.models.User;
import com.example.atmservice.models.enums.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByLogin(String login);

	User findByRolesContains(Role role);
}
