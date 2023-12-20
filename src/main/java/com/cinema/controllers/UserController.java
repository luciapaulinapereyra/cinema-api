package com.cinema.controllers;

import com.cinema.dto.ResponseDTO;
import com.cinema.dto.UserRequestDTO;
import com.cinema.services.KeycloakUserService;
import com.cinema.services.UserService;
import org.keycloak.representations.AccessTokenResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT})
public class UserController {

    @Value("${role.user}")
    public String userRole;

    @Value("${role.admin}")
    public String adminRole;

    @Autowired
    private UserService userService;

    @Autowired
    private KeycloakUserService keycloakUserService;

    @PostMapping("/register/user")
    public ResponseEntity<ResponseDTO> registerUser(@RequestBody UserRequestDTO request) {
        return userService.registerUser(request, userRole);
    }

    @PostMapping("/register/admin")
    public ResponseEntity<ResponseDTO> registerAdmin(@RequestBody UserRequestDTO request) {
        return userService.registerUser(request, adminRole);
    }

    @PostMapping("/auth/login")
    public ResponseEntity<AccessTokenResponse> loginUser(@RequestBody UserRequestDTO req) {
        return ResponseEntity.status(HttpStatus.OK).body(keycloakUserService.login(req));
    }


}
