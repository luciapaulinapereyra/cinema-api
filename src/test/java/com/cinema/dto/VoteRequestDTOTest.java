package com.cinema.dto;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class VoteRequestDTOTest {

    @Test
    void constructor() {
        VoteRequestDTO voteRequestDTO = new VoteRequestDTO(1L, 1);
        assertEquals(1L, voteRequestDTO.getMovieId());
        assertEquals(1, voteRequestDTO.getVote());
    }

    @Test
    void setAndGetMovieId() {
        VoteRequestDTO voteRequestDTO = new VoteRequestDTO();
        voteRequestDTO.setMovieId(1L);
        assertEquals(1L, voteRequestDTO.getMovieId());
    }

    @Test
    void setAndGetVote() {
        VoteRequestDTO voteRequestDTO = new VoteRequestDTO();
        voteRequestDTO.setVote(1);
        assertEquals(1, voteRequestDTO.getVote());
    }
}