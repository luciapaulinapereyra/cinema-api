package com.asap.pocket.configuration;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {
    @Value("${api.code_version}")
    private String api_version;

    @Bean
    public OpenAPI cinemaApi() {
        return new OpenAPI()
                .info(new Info().title("Cinema API")
                        .description("Cinema API implemented with Spring Boot RESTful service and documented using springdoc-openapi and OpenAPI 3.0")
                        .version(api_version)
                        .license(new License().name("Apache 2.0").url("luciapaulinapereyra@gmail.com")))
                .externalDocs(new ExternalDocumentation().description("").url("https://github.com/luciapaulinapereyra/cinema-api"));
    }
}
