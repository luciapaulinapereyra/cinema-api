package com.cinema.controllers;

import com.cinema.dto.MovieDTO;
import com.cinema.dto.ResponseDTO;
import com.cinema.dto.TopMovieDTO;
import com.cinema.dto.VoteRequestDTO;
import com.cinema.models.Movie;
import com.cinema.repositories.MovieRepository;
import com.cinema.services.MovieService;
import com.cinema.services.MovieVoteService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/movies")
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT})
public class MovieController {

    @Autowired
    MovieService movieService;

    @Autowired
    MovieVoteService movieVoteService;

    @GetMapping("/all/{page}/{size}")
    public ResponseEntity<Page<Movie>> getMovies(@PathVariable int page, @PathVariable int size) {
        return movieService.getAllMovies(page, size);
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
    @PreAuthorize("hasRole('admin')")
    public ResponseEntity<ResponseDTO> addMovie(@RequestBody @Validated MovieDTO movie) {
        return movieService.addMovie(movie);
    }

    @PutMapping("/update/{id}")
    @PreAuthorize("hasRole('admin')")
    public ResponseEntity<ResponseDTO> updateMovie(@PathVariable Long id, @RequestBody @Validated MovieDTO movie) {
        return movieService.updateMovie(id, movie);
    }

    @PostMapping("/vote")
    @PreAuthorize("hasRole('user')")
    public ResponseEntity<String> voteForMovie(@RequestBody VoteRequestDTO voteRequest) {
        movieVoteService.voteForMovie(voteRequest.getMovieId(), voteRequest.getVote());
        return ResponseEntity.ok("Voto registrado exitosamente.");
    }

    @GetMapping("/top-movie")
    public ResponseEntity<TopMovieDTO> getTopVotedMovie() {
        TopMovieDTO topMovie = movieVoteService.getTopVotedMovie();
        return ResponseEntity.ok(topMovie);
    }

    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('admin')")
    public ResponseEntity<ResponseDTO> deleteMovie(@PathVariable Long id) {
        return movieService.deleteMovie(id);
    }


}
