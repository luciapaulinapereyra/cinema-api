package com.cinema.dto;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MovieDTOTest {

    @Test
    void testConstructor() {
        MovieDTO movieDTO = new MovieDTO("director", "name", 1.0);

        assertEquals("director", movieDTO.getDirector());
        assertEquals("name", movieDTO.getName());
        assertEquals(1.0, movieDTO.getDuration());
    }

    @Test
    void setAndGetDirector() {
        MovieDTO movieDTO = new MovieDTO();
        movieDTO.setDirector("director");

        assertEquals("director", movieDTO.getDirector());
    }

    @Test
    void setName() {
        MovieDTO movieDTO = new MovieDTO();
        movieDTO.setName("name");

        assertEquals("name", movieDTO.getName());
    }

    @Test
    void setDuration() {
        MovieDTO movieDTO = new MovieDTO();
        movieDTO.setDuration(1.0);

        assertEquals(1.0, movieDTO.getDuration());
    }
}