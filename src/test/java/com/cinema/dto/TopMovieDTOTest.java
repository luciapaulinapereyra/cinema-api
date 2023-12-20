package com.cinema.dto;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class TopMovieDTOTest {

    @Test
    void constructor() {
        TopMovieDTO topMovieDTO = new TopMovieDTO("name", "director", 1.0, 1);
        assertEquals("name", topMovieDTO.getName());
        assertEquals("director", topMovieDTO.getDirector());
        assertEquals(1.0, topMovieDTO.getDuration());
        assertEquals(1, topMovieDTO.getVotes());
    }

    @Test
    void setAndGetName() {
        TopMovieDTO topMovieDTO = new TopMovieDTO();
        topMovieDTO.setName("name");
        assertEquals("name", topMovieDTO.getName());
    }

    @Test
    void setAndGetDirector() {
        TopMovieDTO topMovieDTO = new TopMovieDTO();
        topMovieDTO.setDirector("director");
        assertEquals("director", topMovieDTO.getDirector());
    }

    @Test
    void setAndGetDuration() {
        TopMovieDTO topMovieDTO = new TopMovieDTO();
        topMovieDTO.setDuration(1.0);
        assertEquals(1.0, topMovieDTO.getDuration());
    }

    @Test
    void setAndGetVotes() {
        TopMovieDTO topMovieDTO = new TopMovieDTO();
        topMovieDTO.setVotes(1);
        assertEquals(1, topMovieDTO.getVotes());
    }
}