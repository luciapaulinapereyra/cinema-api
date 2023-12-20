package com.cinema.services;

import com.cinema.dto.ResponseDTO;
import com.cinema.models.Movie;
import com.cinema.models.MovieVote;
import com.cinema.repositories.MovieRepository;
import com.cinema.repositories.MovieVoteRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.ResponseEntity;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class MovieVoteServiceTest {

    @InjectMocks
    private MovieVoteService movieVoteService;

    @Mock
    private MovieVoteRepository movieVoteRepository;

    @Mock
    private MovieRepository movieRepository;

    @Test
    void voteForMovie_WhenMovieHasVotes() {
        Movie movie = new Movie();
        movie.setId(1L);

        when(movieRepository.findById(1L)).thenReturn(Optional.of(movie));

        MovieVote movieVote = new MovieVote();
        movieVote.setMovie(movie);
        movieVote.setVote(1);

        when(movieVoteRepository.findByMovie(movie)).thenReturn(Optional.of(movieVote));

        ResponseEntity<ResponseDTO> res = movieVoteService.voteForMovie(1L, 1);

        assertEquals(200, res.getStatusCodeValue());
        verify(movieVoteRepository).save(movieVote);

    }

    @Test
    void voteForMovie_WhenMovieHasNotVotes() {
        Movie movie = new Movie();
        movie.setId(1L);

        when(movieRepository.findById(1L)).thenReturn(Optional.of(movie));

        MovieVote movieVote = new MovieVote();
        movieVote.setMovie(movie);
        movieVote.setVote(1);

        when(movieVoteRepository.findByMovie(movie)).thenReturn(Optional.empty());

        ResponseEntity<ResponseDTO> res = movieVoteService.voteForMovie(1L, 1);

        assertEquals(200, res.getStatusCodeValue());
        verify(movieVoteRepository).save(any());

    }

    @Test
    void voteForMovie_WhenMovieNotExists() {
        Movie movie = new Movie();
        movie.setId(1L);

        when(movieRepository.findById(1L)).thenReturn(Optional.empty());

        ResponseEntity<ResponseDTO> res = movieVoteService.voteForMovie(1L, 1);

        assertEquals(404, res.getStatusCodeValue());

    }

    @Test
    void voteForMovie_ThrowsError() {
        Movie movie = new Movie();
        movie.setId(1L);

        when(movieRepository.findById(1L)).thenThrow(new RuntimeException());

        ResponseEntity<ResponseDTO> res = movieVoteService.voteForMovie(1L, 1);

        assertEquals(500, res.getStatusCodeValue());

    }

    @Test
    void getTopVotedMovie() {
        MovieVote movieVote = new MovieVote();
        movieVote.setVote(1);
        movieVote.setMovie(new Movie());

        when(movieVoteRepository.findTopMovie()).thenReturn(movieVote);

        assertNotNull(movieVoteService.getTopVotedMovie());
    }

    @Test
    void getTopVotedMovie_ReturnsNull() {
        when(movieVoteRepository.findTopMovie()).thenReturn(null);

        assertNull(movieVoteService.getTopVotedMovie());
    }
}