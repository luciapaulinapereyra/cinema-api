package com.cinema.security;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class KeycloakProviderTest {
    @Mock
    private KeycloakBuilder keycloakBuilder;
    private KeycloakProvider keycloakProvider;

    @BeforeEach
    void setUp() {
        keycloakProvider = new KeycloakProvider();
        ReflectionTestUtils.setField(keycloakProvider, "serverURL", "http://example.com");
        ReflectionTestUtils.setField(keycloakProvider, "clientID", "client_id");
        ReflectionTestUtils.setField(keycloakProvider, "realm", "realm");
        ReflectionTestUtils.setField(keycloakProvider, "clientSecret", "client_secret");
    }

    @Test
    void testGetInstance() {
        Keycloak instance = keycloakProvider.getInstance();

        assertNotNull(instance);
    }

    @Test
    void testNewKeycloakBuilderWithPasswordCredentials() {
        String username = "testuser";
        String password = "testpassword";

        KeycloakBuilder keycloakBuilder = keycloakProvider.newKeycloakBuilderWithPasswordCredentials(username, password);

        assertNotNull(keycloakBuilder);
    }
}