package com.cinema.controllers;

import com.cinema.dto.MovieDTO;
import com.cinema.dto.TopMovieDTO;
import com.cinema.dto.VoteRequestDTO;
import com.cinema.models.Movie;
import com.cinema.services.MovieService;
import com.cinema.services.MovieVoteService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;


import java.util.List;

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

    @MockBean
    private MovieVoteService movieVoteService;

    @Test
    @WithMockUser(roles = "user")
    void getMovies() throws Exception {
        Movie movie = new Movie();
        movie.setId(1L);
        movie.setName("Test");
        movie.setDuration(2.40);
        movie.setDirector("Test");

        Page<Movie> movies = new PageImpl<>(List.of(movie));

        when(movieService.getAllMovies(0, 10)).thenReturn(new ResponseEntity<>(movies, HttpStatus.OK));

        mockMvc.perform(get("/api/movies/all/{page}/{size}", 0, 10)
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.totalElements").value(1));

    }

    @Test
    @WithMockUser(roles = "user")
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
    @WithMockUser(roles = "user")
    void getMovieByName_ReturnsMovieNotFound() throws Exception {
        String name = "Test";
        when(movieService.findByName(name)).thenReturn(null);

        mockMvc.perform(get("/api/movies/findByName/{name}", name))
                .andExpect(status().isNotFound());
    }


    @Test
    @WithMockUser(roles = "admin")
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
    @WithMockUser(roles = "admin")
    void deleteMovie() throws Exception {
        when(movieService.deleteMovie(1L)).thenReturn(new ResponseEntity<>(HttpStatus.OK));
        mockMvc.perform(delete("/api/movies/delete/{id}", 1L))
                .andExpect(status().isOk());
    }

    @Test
    @WithMockUser(roles = "admin")
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


    @Test
    @WithMockUser(roles = "user")
    void voteForMovie() throws Exception {
        VoteRequestDTO req = new VoteRequestDTO();
        req.setMovieId(1L);
        req.setVote(1);
        when(movieVoteService.voteForMovie(1L, 1)).thenReturn(new ResponseEntity<>(HttpStatus.OK));

        mockMvc.perform(post("/api/movies/vote")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(req)))
                .andExpect(status().isOk());
    }

    @Test
    @WithMockUser(roles = "user")
    void getTopVotedMovie ()  throws Exception {
        TopMovieDTO topMovie = new TopMovieDTO();
        topMovie.setName("Test");
        topMovie.setDirector("Test");
        topMovie.setDuration(2.40);
        topMovie.setVotes(1);

        when(movieVoteService.getTopVotedMovie()).thenReturn(topMovie);

        mockMvc.perform(get("/api/movies/top-movie"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Test"));
    }
}