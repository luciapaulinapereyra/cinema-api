package com.cinema.models;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MovieTest {


    @Test
    void testConstructor() {
        Movie movie = new Movie(1L,"director", "name", 1.0);

        assertEquals(1L, movie.getId());
        assertEquals("director", movie.getDirector());
        assertEquals("name", movie.getName());
        assertEquals(1.0, movie.getDuration());
    }

    @Test
    void setAndGetId() {
        Movie movie = new Movie();
        movie.setId(1L);

        assertEquals(1L, movie.getId());
    }

    @Test
    void setAndGetDirector() {
        Movie movie = new Movie();
        movie.setDirector("director");

        assertEquals("director", movie.getDirector());
    }

    @Test
    void setAndGetName() {
        Movie movie = new Movie();
        movie.setName("name");

        assertEquals("name", movie.getName());
    }

    @Test
    void setAndGetDuration() {
        Movie movie = new Movie();
        movie.setDuration(1.0);

        assertEquals(1.0, movie.getDuration());
    }
}