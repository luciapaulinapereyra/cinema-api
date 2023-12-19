package com.cinema.services;

import com.cinema.dto.ResponseDTO;
import com.cinema.dto.UserDTO;
import com.cinema.dto.UserRequestDTO;
import com.cinema.models.User;
import com.cinema.repositories.UserRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class UserService {

    private static Logger logger = Logger.getLogger(KeycloakUserService.class);

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private KeycloakUserService keycloakUserService;


    @Transactional
    public ResponseEntity<ResponseDTO> registerUser(UserRequestDTO request, String role) {
        try {
            UserDTO user = keycloakUserService.registerUserInKeycloak(request, role);
            if (user == null) {
                return new ResponseEntity<>(new ResponseDTO(HttpStatus.BAD_REQUEST, "User already exists"), HttpStatus.BAD_REQUEST);
            }
            //guardo el usuario en la base de datos
            User userToSave = new User();
            userToSave.setEmail(user.getEmail());
            userToSave.setUsername(user.getUsername());
            userToSave.setRole(user.getRole());
            userToSave.setKeycloakId(user.getKeycloakId());
            userRepository.save(userToSave);

            return new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, user, "User created"), HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Error creating user: " + e.getMessage());
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR, "Error creating user"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
