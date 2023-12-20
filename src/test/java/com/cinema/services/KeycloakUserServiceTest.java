package com.cinema.services;

import com.cinema.dto.UserDTO;
import com.cinema.dto.UserRequestDTO;
import com.cinema.security.KeycloakProvider;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.admin.client.resource.*;
import org.keycloak.admin.client.token.TokenManager;
import org.keycloak.representations.AccessTokenResponse;
import org.keycloak.representations.idm.ClientRepresentation;
import org.keycloak.representations.idm.RoleRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import javax.ws.rs.core.Response;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class KeycloakUserServiceTest {

    @InjectMocks
    KeycloakUserService keycloakUserService;

    @Mock
    KeycloakProvider keycloakProvider;

    @Mock
    Keycloak keycloak;

    @BeforeEach
    void setUp() {
        ReflectionTestUtils.setField(keycloakUserService, "clientID", "clientTestId");
        ReflectionTestUtils.setField(keycloakUserService, "realm", "realm");
    }

    @Test
    void registerUserInKeycloak() {
        when(keycloakProvider.getInstance()).thenReturn(keycloak);
        RealmResource realmResource = mock(RealmResource.class);
        when(keycloak.realm("realm")).thenReturn(realmResource);
        UsersResource usersResource = mock(UsersResource.class);
        when(realmResource.users()).thenReturn(usersResource);

        when(usersResource.search("lucia")).thenReturn(List.of());

        UserRepresentation userRepresentation = mock(UserRepresentation.class);
        Response response = Response.created(null).entity(userRepresentation).build();
        when(keycloak.realm("realm").users().create(any())).thenReturn(response);

        //Test función set roles
        ClientsResource clientsResource = mock(ClientsResource.class);
        when(realmResource.clients()).thenReturn(clientsResource);

        UserResource userResource = mock(UserResource.class);
        when(usersResource.get(any())).thenReturn(userResource);


        ClientResource clientResource = mock(ClientResource.class);
        when(clientsResource.get(any())).thenReturn(clientResource);

        ClientRepresentation clientRepresentation = mock(ClientRepresentation.class);
        when(clientsResource.findByClientId(any())).thenReturn(List.of(clientRepresentation));

        RolesResource rolesResource = mock(RolesResource.class);
        when(clientResource.roles()).thenReturn(rolesResource);
        RoleResource roleResource = mock(RoleResource.class);
        when(rolesResource.get("user")).thenReturn(roleResource);
        RoleRepresentation roleRepresentation = mock(RoleRepresentation.class);
        when(roleResource.toRepresentation()).thenReturn(roleRepresentation);


        RoleMappingResource roleMappingResource = mock(RoleMappingResource.class);
        when(userResource.roles()).thenReturn(roleMappingResource);

        RoleScopeResource roleScopeResource = mock(RoleScopeResource.class);
        when(roleMappingResource.clientLevel(any())).thenReturn(roleScopeResource);

        UserRequestDTO userRequestDTO = new UserRequestDTO();
        userRequestDTO.setUsername("lucia");
        userRequestDTO.setEmail("lucia");
        userRequestDTO.setPassword("lucia");

        UserDTO res = keycloakUserService.registerUserInKeycloak(userRequestDTO, "user");

        assertEquals("lucia", res.getUsername());


    }


    @Test
    void registerUserInKeycloak_existingUser() {
        when(keycloakProvider.getInstance()).thenReturn(keycloak);
        when(keycloakProvider.getInstance()).thenReturn(keycloak);
        RealmResource realmResource = mock(RealmResource.class);
        when(keycloak.realm("realm")).thenReturn(realmResource);
        UsersResource usersResource = mock(UsersResource.class);
        when(realmResource.users()).thenReturn(usersResource);

        when(usersResource.search(any())).thenReturn(List.of(new UserRepresentation()));

        UserDTO res = keycloakUserService.registerUserInKeycloak(new UserRequestDTO(), "user");

        assertNull(res);
    }

    @Test
    void registerUserInKeycloak_ThrowsError() {
        when(keycloakProvider.getInstance()).thenReturn(keycloak);
        RealmResource realmResource = mock(RealmResource.class);
        when(keycloak.realm("realm")).thenReturn(realmResource);
        UsersResource usersResource = mock(UsersResource.class);
        when(realmResource.users()).thenReturn(usersResource);

        when(usersResource.search("lucia")).thenReturn(List.of());

        UserRepresentation userRepresentation = mock(UserRepresentation.class);
        when(keycloak.realm("realm").users().create(any())).thenThrow(new RuntimeException());

        UserRequestDTO userRequestDTO = new UserRequestDTO();
        userRequestDTO.setUsername("lucia");
        userRequestDTO.setEmail("lucia");
        userRequestDTO.setPassword("lucia");

        assertThrows(RuntimeException.class, () -> keycloakUserService.registerUserInKeycloak(userRequestDTO, "user"));

    }

    @Test
    void login() {
        UserRequestDTO req = new UserRequestDTO();
        req.setUsername("test@test.com");
        req.setPassword("test");


        AccessTokenResponse loginToken = Mockito.mock(AccessTokenResponse.class);
        KeycloakBuilder keycloakBuilder = Mockito.mock(KeycloakBuilder.class);


        when(keycloakProvider.newKeycloakBuilderWithPasswordCredentials("test@test.com", "test")).thenReturn(keycloakBuilder);
        when(keycloakBuilder.build()).thenReturn(keycloak); // Simula la creación de Keycloak

        TokenManager tokenManager = Mockito.mock(TokenManager.class);
        when(keycloak.tokenManager()).thenReturn(tokenManager);
        when(tokenManager.getAccessToken()).thenReturn(loginToken);

        AccessTokenResponse result = keycloakUserService.login(req);

        assertNotNull(result);
    }

}