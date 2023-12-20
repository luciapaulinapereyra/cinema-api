package com.cinema.services;

import com.cinema.dto.MovieDTO;
import com.cinema.dto.ResponseDTO;
import com.cinema.models.Movie;
import com.cinema.repositories.MovieRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;

import java.awt.geom.RectangularShape;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class MovieServiceTest {

    @InjectMocks
    MovieService movieService;

    @Mock
    MovieRepository movieRepository;

    @Mock
    ModelMapper modelMapper;

    @Test
    void getAllMovies() {

        Movie movie = new Movie();
        movie.setId(1L);
        movie.setName("Test");
        movie.setDuration(2.40);
        movie.setDirector("Test");
        Page<Movie> movies = new PageImpl<>(List.of(movie));
        when(movieRepository.findAll(PageRequest.of(1, 10))).thenReturn(movies);

        ResponseEntity<Page<Movie>> responseEntity = movieService.getAllMovies(1, 10);
        assertEquals(1, responseEntity.getBody().getTotalElements());
        assertEquals(200, responseEntity.getStatusCodeValue());
    }

    @Test
    void getAllMovies_ReturnsNoContent() {

        Movie movie = new Movie();
        movie.setId(1L);
        movie.setName("Test");
        movie.setDuration(2.40);
        movie.setDirector("Test");
        when(movieRepository.findAll(PageRequest.of(1, 10))).thenReturn(Page.empty());

        ResponseEntity<Page<Movie>> responseEntity = movieService.getAllMovies(1, 10);
        assertEquals(204, responseEntity.getStatusCodeValue());
    }

    @Test
    void getAllMovies_ThrowsError() {

        Movie movie = new Movie();
        movie.setId(1L);
        movie.setName("Test");
        movie.setDuration(2.40);
        movie.setDirector("Test");
        when(movieRepository.findAll(PageRequest.of(1, 10))).thenThrow(new RuntimeException());

        ResponseEntity<Page<Movie>> responseEntity = movieService.getAllMovies(1, 10);
        assertEquals(500, responseEntity.getStatusCodeValue());
    }

    @Test
    void addMovie() {
        MovieDTO movieReq = new MovieDTO();
        movieReq.setName("Test Movie");
        movieReq.setDuration(120.0);
        movieReq.setDirector("Test Director");
        when(movieRepository.findByName("Test Movie")).thenReturn(Optional.empty());


        ResponseEntity<ResponseDTO> responseEntity = movieService.addMovie(movieReq);
        assertEquals(200, responseEntity.getStatusCodeValue());

        verify(movieRepository).save(any(Movie.class));

    }

    @Test
    void addMovie_WhenMovieFound() {

        MovieDTO movieReq = new MovieDTO();
        movieReq.setName("Test Movie");
        movieReq.setDuration(120.0);
        movieReq.setDirector("Test Director");
        when(movieRepository.findByName("Test Movie")).thenReturn(Optional.of(new Movie()));

        ResponseEntity<ResponseDTO> responseEntity = movieService.addMovie(movieReq);
        assertEquals(409, responseEntity.getStatusCodeValue());
    }

    @Test
    void addMovie_ThrowsError() {
        MovieDTO movieReq = new MovieDTO();
        movieReq.setName("Test Movie");
        movieReq.setDuration(120.0);
        movieReq.setDirector("Test Director");
        when(movieRepository.findByName("Test Movie")).thenThrow(new RuntimeException());

        ResponseEntity<ResponseDTO> responseEntity = movieService.addMovie(movieReq);
        assertEquals(500, responseEntity.getStatusCodeValue());

    }

    @Test
    void findByName_WhenMovieExists() {
        Movie movie = new Movie();
        movie.setName("Test Movie");
        when(movieRepository.findByName("Test Movie")).thenReturn(Optional.of(movie));

        Movie foundMovie = movieService.findByName("Test Movie");
        assertEquals("Test Movie", foundMovie.getName());

    }

    @Test
    void findByName_WhenMovieNotExists() {
        when(movieRepository.findByName("Test Movie")).thenReturn(Optional.empty());

        Movie foundMovie = movieService.findByName("Test Movie");
        assertNull(foundMovie);

    }

    @Test
    void findByName_ThrowsError() {
        Movie movie = new Movie();
        movie.setName("Test Movie");
        when(movieRepository.findByName("Test Movie")).thenThrow(new RuntimeException());

        Movie foundMovie = movieService.findByName("Test Movie");
        assertNull(foundMovie);
    }

    @Test
    void deleteMovie() {
        Long id = 1L;
        when(movieRepository.findById(id)).thenReturn(Optional.of(new Movie()));

        ResponseEntity<ResponseDTO> responseEntity = movieService.deleteMovie(id);

        assertEquals(200, responseEntity.getStatusCodeValue());
    }

    @Test
    void deleteMovie_WhenMovieNotExists() {
        Long id = 1L;
        when(movieRepository.findById(id)).thenReturn(Optional.empty());

        ResponseEntity<ResponseDTO> responseEntity = movieService.deleteMovie(id);

        assertEquals(404, responseEntity.getStatusCodeValue());
    }

    @Test
    void deleteMovie_ThrowsError() {
        Long id = 1L;
        when(movieRepository.findById(id)).thenThrow(new RuntimeException());

        ResponseEntity<ResponseDTO> responseEntity = movieService.deleteMovie(id);

        assertEquals(500, responseEntity.getStatusCodeValue());
    }

    @Test
    void updateMovie() {
        Long id = 1L;
        MovieDTO movieReq = new MovieDTO();
        movieReq.setName("Test Movie");
        movieReq.setDuration(120.0);
        movieReq.setDirector("Test Director");
        when(movieRepository.findById(id)).thenReturn(Optional.of(new Movie()));

        ResponseEntity<ResponseDTO> responseEntity = movieService.updateMovie(id, movieReq);

        assertEquals(200, responseEntity.getStatusCodeValue());
    }

    @Test
    void updateMovie_WhenMovieNotExists() {
        Long id = 1L;
        MovieDTO movieReq = new MovieDTO();
        movieReq.setName("Test Movie");
        movieReq.setDuration(120.0);
        movieReq.setDirector("Test Director");
        when(movieRepository.findById(id)).thenReturn(Optional.empty());

        ResponseEntity<ResponseDTO> responseEntity = movieService.updateMovie(id, movieReq);

        assertEquals(404, responseEntity.getStatusCodeValue());
    }

    @Test
    void updateMovie_ThrowsError() {
        Long id = 1L;
        MovieDTO movieReq = new MovieDTO();
        movieReq.setName("Test Movie");
        movieReq.setDuration(120.0);
        movieReq.setDirector("Test Director");
        when(movieRepository.findById(id)).thenThrow(new RuntimeException());

        ResponseEntity<ResponseDTO> responseEntity = movieService.updateMovie(id, movieReq);

        assertEquals(500, responseEntity.getStatusCodeValue());
    }
}