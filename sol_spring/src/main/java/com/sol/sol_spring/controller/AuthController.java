package com.sol.sol_spring.controller;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import com.sol.sol_spring.repository.UserRepository;
import com.sol.sol_spring.service.AuthService;
import com.sol.sol_spring.entity.Users;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
public class AuthController {
    private AuthService authService;

    @Autowired
    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody Users user) {
        authService.register(user);
        return ResponseEntity.ok("User register successfully!");
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody Users user) {
        authService.login(user.getUserName(), user.getPass());
        return ResponseEntity.ok("Login successfully!");
    }

}
