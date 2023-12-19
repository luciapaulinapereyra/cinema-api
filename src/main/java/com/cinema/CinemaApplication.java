package com.cinema;

import lombok.Generated;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@EnableWebMvc
public class CinemaApplication {

	@Generated
	public static void main(String[] args) {
		SpringApplication.run(CinemaApplication.class, args);
	}

}
