package com.sol.sol_spring.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.sol.sol_spring.entity.Users;

public interface UserRepository extends JpaRepository<Users, Integer> {
    Optional<Users> findByUserName(String userName);
}
