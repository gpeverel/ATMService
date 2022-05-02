package com.example.atmservice.services;

import com.example.atmservice.models.Client;
import com.example.atmservice.models.User;
import com.example.atmservice.models.enums.Role;
import com.example.atmservice.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
		user.setActive(true);//TODO понять на каком этапе изменять на true
		user.getRoles().add(role); //TODO роли тоже нужно где-то изменять
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userRepository.save(user);
		log.info("Saving new user with login: {}", login);
		return true;
	}

	public User getUserByLogin(String login) {
		return userRepository.findByLogin(login);
	}
}
