package com.example.atmservice.services;

import com.example.atmservice.models.Client;
import com.example.atmservice.models.User;
import com.example.atmservice.models.enums.Role;
import com.example.atmservice.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;

	public boolean createUser(User user, Role role){
		String login = user.getLogin();
		if (userRepository.findByLogin(login) != null) {
			return false;
		}
		if (role == Role.ROLE_ADMIN) {
			user.setActive(true);
		}
		else {
			user.setActive(false);
		}
		user.getRoles().add(role);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userRepository.save(user);
		log.info("Saving new user with login: {}", login);
		return true;
	}

	public User getUserByLogin(String login) {
		return userRepository.findByLogin(login);
	}

	public User getUserByRole(Role role) {
		return userRepository.findByRolesContains(role);
	}

	public void activateOrBanUser(Long id) {
		User user = userRepository.findById(id).orElse(null);
		if (user != null) {
			if (user.isActive()) {
				user.setActive(false);
				log.info("BAN USER WITH LOGIN {}", user.getLogin());
			}
			else {
				user.setActive(true);
				log.info("USER ACTIVATED WITH LOGIN {}", user.getLogin());
			}
			userRepository.save(user);
		}
	}

}
