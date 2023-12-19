package com.cinema.controllers;

import com.cinema.dto.MovieDTO;
import com.cinema.dto.ResponseDTO;
import com.cinema.models.Movie;
import com.cinema.repositories.MovieRepository;
import com.cinema.services.MovieService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/movies")
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT})
public class MovieController {

    @Autowired
    MovieService movieService;

    @GetMapping
    public ResponseEntity<List<Movie>> getMovies() {
        return movieService.getAllMovies();
    }

    @GetMapping("/findByName/{name}")
    public ResponseEntity<Movie> getMovieByName(@PathVariable String name) {
        Movie movie = movieService.findByName(name);
        if (movie == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(movie, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<ResponseDTO> addMovie(@RequestBody @Validated MovieDTO movie) {
        return movieService.addMovie(movie);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<ResponseDTO> deleteMovie(@PathVariable Long id) {
        return movieService.deleteMovie(id);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<ResponseDTO> updateMovie(@PathVariable Long id, @RequestBody @Validated MovieDTO movie) {
        return movieService.updateMovie(id, movie);
    }


}
