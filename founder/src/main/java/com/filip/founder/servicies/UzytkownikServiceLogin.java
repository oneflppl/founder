package com.filip.founder.servicies;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.filip.founder.entities.Uzytkownik;

@Service
@Transactional(readOnly = true)
public class UzytkownikServiceLogin implements UserDetailsService {

	@Autowired
	UzytkownikService users;

	public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {

		Uzytkownik u = users.findUzytkownikByLogin(login);

		return new org.springframework.security.core.userdetails.User(u.getLogin(), u.getPwd(), true, true, true, true,
				getAuthorities(u.getRole().getId()));

	}

	public List getAuthorities(Long role) {
		List authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}

	public List getRoles(Long role) {
		List roles = new ArrayList();
		if (role.intValue() == 1) {
			roles.add("ROLE_KLIENT");
			roles.add("ROLE_ADMIN");

		} else if (role.intValue() == 2) {
			roles.add("ROLE_KLIENT");
		} else if (role.intValue() == 3) {
			roles.add("ROLE_MOBILE");
		}
		return roles;
	}

	public static List getGrantedAuthorities(List<String> roles) {
		List authorities = new ArrayList();
		for (String role : roles) {

			authorities.add(new SimpleGrantedAuthority(role));
			System.out.println(role);
		}
		return authorities;
	}

	public UzytkownikServiceLogin() {
		// TODO Auto-generated constructor stub
	}

}