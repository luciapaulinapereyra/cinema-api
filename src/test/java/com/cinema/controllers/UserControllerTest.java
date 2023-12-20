package com.cinema.controllers;

import com.cinema.dto.ResponseDTO;
import com.cinema.dto.UserRequestDTO;
import com.cinema.services.KeycloakUserService;
import com.cinema.services.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.keycloak.representations.AccessTokenResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;


import java.util.List;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("develop")
class UserControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UserService userService;

    @MockBean
    private KeycloakUserService keycloakUserService;

    @Value("${role.user}")
    public String userRole;

    @Value("${role.admin}")
    public String adminRole;
    @Test
    void registerUser() throws Exception {
        UserRequestDTO userRequestDTO = new UserRequestDTO();
        when(userService.registerUser(userRequestDTO, userRole))
                .thenReturn(new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, "Ok"), HttpStatus.OK));

        mockMvc.perform(post("/api/users/register/user")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(new UserRequestDTO())))
                .andExpect(status().isOk());

    }

    @Test
    void registerAdmin() throws Exception {
        UserRequestDTO userRequestDTO = new UserRequestDTO();
        when(userService.registerUser(userRequestDTO, adminRole))
                .thenReturn(new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, "Ok"), HttpStatus.OK));

        mockMvc.perform(post("/api/users/register/admin")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(new UserRequestDTO())))
                .andExpect(status().isOk());

    }


    @Test
    void login() throws Exception{
        UserRequestDTO userRequestDTO = new UserRequestDTO();

        AccessTokenResponse tokenResponse = new AccessTokenResponse();

        when(keycloakUserService.login(userRequestDTO)).thenReturn(tokenResponse);

        mockMvc.perform(post("/api/users/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(userRequestDTO)))
                .andExpect(status().isOk());

        verify(keycloakUserService, times(1)).login(any(UserRequestDTO.class));

    }
}