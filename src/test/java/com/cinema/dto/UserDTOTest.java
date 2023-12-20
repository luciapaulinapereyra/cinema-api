package com.cinema.dto;

import org.junit.jupiter.api.Test;
import org.keycloak.jose.jwk.JWK;

import static org.junit.jupiter.api.Assertions.*;

class UserDTOTest {

    @Test
    void constructor() {
        UserDTO userDTO = new UserDTO("username", "email", "role", "keycloakId");
        assertEquals("username", userDTO.getUsername());
        assertEquals("email", userDTO.getEmail());
        assertEquals("role", userDTO.getRole());
        assertEquals("keycloakId", userDTO.getKeycloakId());
    }

    @Test
    void setAndGetUsername() {
        UserDTO userDTO = new UserDTO();
        userDTO.setUsername("username");
        assertEquals("username", userDTO.getUsername());
    }

    @Test
    void setAndGetEmail() {
        UserDTO userDTO = new UserDTO();
        userDTO.setEmail("email");
        assertEquals("email", userDTO.getEmail());
    }

    @Test
    void setAndGetRole() {
        UserDTO userDTO = new UserDTO();
        userDTO.setRole("role");
        assertEquals("role", userDTO.getRole());
    }

    @Test
    void setAndGetKeycloakId() {
        UserDTO userDTO = new UserDTO();
        userDTO.setKeycloakId("keycloakId");
        assertEquals("keycloakId", userDTO.getKeycloakId());
    }
}