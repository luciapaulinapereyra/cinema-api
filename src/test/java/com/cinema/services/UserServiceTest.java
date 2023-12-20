package com.cinema.services;

import com.cinema.dto.ResponseDTO;
import com.cinema.dto.UserDTO;
import com.cinema.dto.UserRequestDTO;
import com.cinema.repositories.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.ResponseEntity;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @InjectMocks
    UserService userService;

    @Mock
    UserRepository userRepository;

    @Mock
    KeycloakUserService keycloakUserService;

    @Test
    void registerUser() {
        UserDTO userDTO = new UserDTO();
        userDTO.setKeycloakId("123");
        userDTO.setEmail("lucia");
        userDTO.setUsername("lucia");
        userDTO.setRole("user");

        when(keycloakUserService.registerUserInKeycloak(any(), any())).thenReturn(userDTO);

        UserRequestDTO userRequestDTO = new UserRequestDTO();
        ResponseEntity<ResponseDTO> response = userService.registerUser(userRequestDTO, "user");

        assertEquals(200, response.getStatusCodeValue());
        assertEquals("User created", response.getBody().getDescription());
        assertNotNull(response.getBody().getContent());

    }

    @Test
    void registerUser_WhenUserNotExists() {
        UserDTO userDTO = new UserDTO();
        userDTO.setKeycloakId("123");
        when(keycloakUserService.registerUserInKeycloak(any(), any())).thenReturn(null);

        ResponseEntity<ResponseDTO> response = userService.registerUser(new UserRequestDTO(), "user");

        assertEquals(400, response.getStatusCodeValue());
        assertEquals("User already exists", response.getBody().getDescription());
        assertNull(response.getBody().getContent());

    }

    @Test
    void registerUser_ThrowsError() {
        UserDTO userDTO = new UserDTO();
        userDTO.setKeycloakId("123");
        when(keycloakUserService.registerUserInKeycloak(any(), any())).thenThrow(new RuntimeException());

        ResponseEntity<ResponseDTO> response = userService.registerUser(new UserRequestDTO(), "user");

        assertEquals(500, response.getStatusCodeValue());
        assertEquals("Error creating user", response.getBody().getDescription());
        assertNull(response.getBody().getContent());

    }
}