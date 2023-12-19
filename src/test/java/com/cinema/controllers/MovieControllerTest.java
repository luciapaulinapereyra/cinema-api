package com.cinema.controllers;

import com.cinema.dto.MovieDTO;
import com.cinema.models.Movie;
import com.cinema.services.MovieService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.test.web.servlet.MockMvc;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import static org.assertj.core.internal.bytebuddy.matcher.ElementMatchers.is;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;


@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("develop")
class MovieControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private MovieService movieService;

    @Test
    void getMovies() throws Exception {
        Movie movie = new Movie();
        movie.setId(1L);
        movie.setName("Test");
        movie.setDuration(2.40);
        movie.setDirector("Test");
        when(movieService.getAllMovies()).thenReturn(new ResponseEntity<>(List.of(movie), HttpStatus.OK));

        mockMvc.perform(get("/api/movies"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].id").value(1L))
                .andExpect(jsonPath("$[0].name").value("Test"))
                .andExpect(jsonPath("$[0].duration").value(2.40))
                .andExpect(jsonPath("$[0].director").value("Test"));
    }

    @Test
    void getMovieByName_ReturnsOk() throws Exception {
        String name = "Test";

        Movie movie = new Movie();
        movie.setName(name);
        when(movieService.findByName(name)).thenReturn(movie);

        mockMvc.perform(get("/api/movies/findByName/{name}", name))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value(name));
    }

    @Test
    void getMovieByName_ReturnsMovieNotFound() throws Exception {
        String name = "Test";
        when(movieService.findByName(name)).thenReturn(null);

        mockMvc.perform(get("/api/movies/findByName/{name}", name))
                .andExpect(status().isNotFound());
    }


    @Test
    void addMovie() throws Exception {
        MovieDTO movieReq = new MovieDTO();
        movieReq.setName("Test");
        movieReq.setDuration(2.40);
        movieReq.setDirector("Test");

        when(movieService.addMovie(movieReq)).thenReturn(new ResponseEntity<>(HttpStatus.OK));

        mockMvc.perform(post("/api/movies")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(movieReq)))
                .andExpect(status().isOk());

    }


    @Test
    void deleteMovie() throws Exception {
        when(movieService.deleteMovie(1L)).thenReturn(new ResponseEntity<>(HttpStatus.OK));
        mockMvc.perform(delete("/api/movies/delete/{id}", 1L))
                .andExpect(status().isOk());
    }

    @Test
    void updateMovie() throws Exception {
        MovieDTO req = new MovieDTO();
        req.setName("Test");
        req.setDuration(2.40);
        req.setDirector("Test");
        when(movieService.updateMovie(1L, req)).thenReturn(new ResponseEntity<>(HttpStatus.OK));

        mockMvc.perform(put("/api/movies/update/{id}", 1L)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(req)))
                .andExpect(status().isOk());
    }


}