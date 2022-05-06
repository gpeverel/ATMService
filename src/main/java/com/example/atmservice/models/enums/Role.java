package com.example.atmservice.models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
	ROLE_CLIENT, ROLE_ADMIN, ROLE_WORKER;

	@Override
	public String getAuthority() {
		return name();
	}
}
