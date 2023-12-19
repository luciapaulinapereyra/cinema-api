package com.cinema.controllers;

import com.cinema.dto.ResponseDTO;
import com.cinema.dto.UserRequestDTO;
import com.cinema.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Value("${role.user}")
    public String userRole;

    @Value("${role.admin}")
    public String adminRole;

    @Autowired
    private UserService userService;

    @PostMapping("/register/user")
    public ResponseEntity<ResponseDTO> registerUser(@RequestBody UserRequestDTO request) {
        return userService.registerUser(request, userRole);
    }

    @PostMapping("/register/admin")
    public ResponseEntity<ResponseDTO> registerAdmin(@RequestBody UserRequestDTO request) {
        return userService.registerUser(request, adminRole);
    }


}
