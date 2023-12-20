package com.cinema.models;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserTest {

    @Test
    void constructor() {
        User user = new User(1L, "lucia", "test", "user", "123");

        assertNotNull(user);
    }

    @Test
    void setAndGetId() {
        User user = new User();
        user.setId(1L);
        assertEquals(1L, user.getId());
    }

    @Test
    void setAndGetUsername() {
        User user = new User();
        user.setUsername("lucia");
        assertEquals("lucia", user.getUsername());
    }

    @Test
    void setAndGetEmail() {
        User user = new User();
        user.setEmail("test@test.com");
        assertEquals("test@test.com", user.getEmail());
    }

    @Test
    void setAndGetRole() {
        User user = new User();
        user.setRole("admin");
        assertEquals("admin", user.getRole());
    }

    @Test
    void setAndGetKeycloakId() {
        User user = new User();
        user.setKeycloakId("123");
        assertEquals("123", user.getKeycloakId());
    }
}