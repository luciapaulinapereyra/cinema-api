package com.cinema.config;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import static org.junit.jupiter.api.Assertions.assertEquals;

@ExtendWith(MockitoExtension.class)
class SwaggerConfigTest {

    @InjectMocks
    private SwaggerConfig swaggerConfig;


    @BeforeEach
    void setUp() {
        ReflectionTestUtils.setField(swaggerConfig, "api_version", "1.0.0");
    }

    @Test
    void testPocketApiConfiguration() {

        OpenAPI openAPI = swaggerConfig.cinemaApi();

        Info info = openAPI.getInfo();
        ExternalDocumentation externalDocs = openAPI.getExternalDocs();

        assertEquals("Cinema API", info.getTitle());
        assertEquals("Cinema API implemented with Spring Boot RESTful service and documented using springdoc-openapi and OpenAPI 3.0", info.getDescription());
        assertEquals("1.0.0", info.getVersion());
        assertEquals("Apache 2.0", info.getLicense().getName());
        assertEquals("luciapaulinapereyra@gmail.com", info.getLicense().getUrl());
        assertEquals("", externalDocs.getDescription());
        assertEquals("https://github.com/luciapaulinapereyra/cinema-api", externalDocs.getUrl());
    }
}