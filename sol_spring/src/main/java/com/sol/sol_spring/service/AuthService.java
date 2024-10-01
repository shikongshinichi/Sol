package com.sol.sol_spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.sol.sol_spring.entity.Users;
import com.sol.sol_spring.exception.UserException;
import com.sol.sol_spring.repository.UserRepository;
import com.sol.sol_spring.util.Security;

import java.util.Optional;

public class AuthService {
    private final UserRepository userRepository;

    @Autowired
    public AuthService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Users register(Users user) {
        Optional<Users> existingUser = userRepository.findByUserName(user.getUserName());
        if (existingUser.isPresent()) {
            throw new UserException("Username already exists.");
        }
        String passMD5 = new Security().convertMD5(user.getPass());
        user.setPass(passMD5);
        return userRepository.save(user);
    }

    public Users login(String username, String pass) {
        String passMD5 = new Security().convertMD5(pass);

        Optional<Users> existingUser = userRepository.findByUserName(username);
        if (!existingUser.isPresent() && existingUser.get().getPass().equals(passMD5)) {
            throw new UserException("Invalid username or password.");
        }
        return existingUser.get();
    }
}
