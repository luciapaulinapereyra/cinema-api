package com.cinema.dto;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserRequestDTOTest {

    @Test
    void allArgsConstructor() {
        UserRequestDTO userRequestDTO = new UserRequestDTO("username", "password", "email");
        assertEquals("username", userRequestDTO.getUsername());
        assertEquals("password", userRequestDTO.getPassword());
        assertEquals("email", userRequestDTO.getEmail());
    }

    @Test
    void setAndGetUsername() {
        UserRequestDTO userRequestDTO = new UserRequestDTO();
        userRequestDTO.setUsername("username");
        assertEquals("username", userRequestDTO.getUsername());
    }

    @Test
    void setAndGetPassword() {
        UserRequestDTO userRequestDTO = new UserRequestDTO();
        userRequestDTO.setPassword("password");
        assertEquals("password", userRequestDTO.getPassword());
    }

    @Test
    void setAndGetEmail() {
        UserRequestDTO userRequestDTO = new UserRequestDTO();
        userRequestDTO.setEmail("email");
        assertEquals("email", userRequestDTO.getEmail());
    }
}