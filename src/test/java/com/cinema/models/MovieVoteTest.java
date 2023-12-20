package com.cinema.models;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MovieVoteTest {

    @Test
    void constructor() {
        Movie movie = new Movie();
        MovieVote movieVote = new MovieVote(1L, movie, 1);
        assertEquals(1L, movieVote.getId());
        assertEquals(movie, movieVote.getMovie());
        assertEquals(1, movieVote.getVote());
    }

    @Test
    void setId() {
        MovieVote movieVote = new MovieVote();
        movieVote.setId(1L);
        assertEquals(1L, movieVote.getId());
    }

    @Test
    void setMovie() {
        Movie movie = new Movie();
        MovieVote movieVote = new MovieVote();
        movieVote.setMovie(movie);
        assertEquals(movie, movieVote.getMovie());
    }

    @Test
    void setVote() {
        MovieVote movieVote = new MovieVote();
        movieVote.setVote(1);
        assertEquals(1, movieVote.getVote());
    }
}