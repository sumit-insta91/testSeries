package com.testdunia.oltest.service;

import com.testdunia.oltest.model.UserBase;

public interface UserService {
    void save(UserBase user);

    UserBase findByEmail(String email);
}
