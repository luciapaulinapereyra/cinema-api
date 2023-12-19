package com.cinema.services;

import com.cinema.dto.MovieDTO;
import org.apache.log4j.Logger;
import com.cinema.dto.ResponseDTO;
import com.cinema.models.Movie;
import com.cinema.repositories.MovieRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MovieService {

    @Autowired
    MovieRepository movieRepository;

    private static Logger logger = Logger.getLogger(MovieService.class);

    public ResponseEntity<Page<Movie>> getAllMovies(int page, int size) {
        try {
            Page<Movie> movies = movieRepository.findAll(PageRequest.of(page, size));
            if (movies.isEmpty())
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            return new ResponseEntity<>(movies, HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Error getting movies: " + e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    public ResponseEntity<ResponseDTO> addMovie(MovieDTO movieRequest) {
        try {
            Movie movieFound = movieRepository.findByName(movieRequest.getName()).orElse(null);
            if (movieFound != null)
                return new ResponseEntity<>(new ResponseDTO(HttpStatus.CONFLICT, "Movie already exists"), HttpStatus.CONFLICT);

            Movie movie = new ModelMapper().map(movieRequest, Movie.class);
            movieRepository.save(movie);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, movie, "Movie added successfully"), HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Error adding movie: " + e);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR, "Error adding movie: " + e), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public Movie findByName(String name) {
        try {
            Optional<Movie> movie = movieRepository.findByName(name);
            if (movie.isEmpty()) {
                logger.error("Movie not found");
                return null;
            }
            return movie.get();

        } catch (Exception e) {
            logger.error("Error finding movie: " + e);
            return null;
        }
    }

    public ResponseEntity<ResponseDTO> deleteMovie(Long id) {
        try {
            Optional<Movie> movie = movieRepository.findById(id);
            if (movie.isEmpty())
                return new ResponseEntity<>(new ResponseDTO(HttpStatus.NOT_FOUND, "Movie not found"), HttpStatus.NOT_FOUND);
            movieRepository.deleteById(id);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, "Movie deleted successfully"), HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Error deleting movie: " + e);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR, "Error deleting movie: " + e), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<ResponseDTO> updateMovie(Long id, MovieDTO movie) {
        try {
            Optional<Movie> findMovie = movieRepository.findById(id);
            if (!findMovie.isPresent())
                return new ResponseEntity<>(new ResponseDTO(HttpStatus.NOT_FOUND, "Movie not found"), HttpStatus.NOT_FOUND);

            Movie movieToUpdate = findMovie.get();

            movieToUpdate.setName(movie.getName());
            movieToUpdate.setDirector(movie.getDirector());
            movieToUpdate.setDuration(movie.getDuration());

            movieRepository.save(movieToUpdate);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, movie, "Movie updated successfully"), HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Error updating movie: " + e);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR, "Error updating movie: " + e), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


}

