package com.testdunia.oltest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.testdunia.oltest.model.UserBase;

public interface UserRepository extends JpaRepository<UserBase, Integer> {
    UserBase findByEmail(String email);
    UserBase findById(Long id);
}
