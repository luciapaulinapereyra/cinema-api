package com.cinema.services;

import com.cinema.dto.ResponseDTO;
import com.cinema.dto.TopMovieDTO;
import com.cinema.models.Movie;
import com.cinema.models.MovieVote;
import com.cinema.repositories.MovieRepository;
import com.cinema.repositories.MovieVoteRepository;
import com.cinema.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MovieVoteService {

    @Autowired
    private MovieVoteRepository movieVoteRepository;

    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private UserRepository userRepository;


    public ResponseEntity<ResponseDTO> voteForMovie(Long movieId, int vote) {
        try {

            Optional<Movie> movieF = movieRepository.findById(movieId);
            if (!movieF.isPresent()) {
                return new ResponseEntity<>(new ResponseDTO(HttpStatus.NOT_FOUND, "Pelicula no encontrada"), HttpStatus.NOT_FOUND);
            }

            Movie movie = movieF.get();
            Optional<MovieVote> movieVote = movieVoteRepository.findByMovie(movie);
            if (movieVote.isPresent()) {
                movieVote.get().setVote(movieVote.get().getVote() + vote);
                MovieVote updatedMovieVote = movieVote.get();
                movieVoteRepository.save(updatedMovieVote);
            } else {
                MovieVote newMovieVote = new MovieVote();
                newMovieVote.setMovie(movie);
                newMovieVote.setVote(vote);
                movieVoteRepository.save(newMovieVote);
            }

            return new ResponseEntity<>(new ResponseDTO(HttpStatus.OK, "Voto registrado"), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR, "Error al votar"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public TopMovieDTO getTopVotedMovie() {
        MovieVote topMovieVote = movieVoteRepository.findTopMovie();
        if (topMovieVote == null) {
            return null;
        }
        TopMovieDTO topMovieDTO = new TopMovieDTO();
        topMovieDTO.setName(topMovieVote.getMovie().getName());
        topMovieDTO.setDirector(topMovieVote.getMovie().getDirector());
        topMovieDTO.setDuration(topMovieVote.getMovie().getDuration());
        topMovieDTO.setVotes(topMovieVote.getVote());
        return topMovieDTO;
    }
}
