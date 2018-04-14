package com.testdunia.oltest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.testdunia.oltest.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
    Role findByName(String roleName);
}
