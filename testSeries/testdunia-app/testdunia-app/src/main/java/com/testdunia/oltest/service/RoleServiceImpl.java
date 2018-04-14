package com.testdunia.oltest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.testdunia.oltest.model.Role;
import com.testdunia.oltest.repository.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	RoleRepository roleRepository;
	
	@Override
	public Role findByName(String roleName) {
		return roleRepository.findByName(roleName);
	}

}
