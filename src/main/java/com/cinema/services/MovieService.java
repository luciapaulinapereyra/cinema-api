package com.cinema.services;

import org.apache.log4j.Logger;
import com.cinema.dto.ResponseDTO;
import com.cinema.models.Movie;
import com.cinema.repositories.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
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

    public List<Movie> getAllMovies() {
        return movieRepository.findAll();
    }

    public ResponseEntity<ResponseDTO> addMovie(Movie movie) {
        try {
            Movie movieFound = findByName(movie.getName());
            if (movieFound != null)
                return new ResponseEntity<>(new ResponseDTO(HttpStatus.CONFLICT, "Movie already exists"), HttpStatus.CONFLICT);
            movieRepository.save(movie);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, "Movie added successfully"), HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Error adding movie: " + e);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR, "Error adding movie: " + e), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public Movie findByName(String name) {
        try {
            Optional<Movie> movie = movieRepository.findByName(name);
            if (!movie.isPresent()) {
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
            movieRepository.deleteById(id);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, "Movie deleted successfully"), HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Error deleting movie: " + e);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR, "Error deleting movie: " + e), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<ResponseDTO> updateMovie(Long id, Movie movie) {
        try {
            Optional<Movie> findMovie = movieRepository.findById(id);
            if (!findMovie.isPresent()) return  new ResponseEntity<>(new ResponseDTO(HttpStatus.NOT_FOUND, "Movie not found"), HttpStatus.NOT_FOUND);

            Movie movieToUpdate = findMovie.get();

            if (movie.getName() != null) movieToUpdate.setName(movie.getName());
            if (movie.getDirector() != null) movieToUpdate.setDirector(movie.getDirector());
            if (movie.getDuration() != null) movieToUpdate.setDuration(movie.getDuration());

            movieRepository.save(movieToUpdate);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, "Movie updated successfully"), HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Error updating movie: " + e);
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR, "Error updating movie: " + e), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


}

