package com.cinema.repositories;

import com.cinema.models.Movie;
import com.cinema.models.MovieVote;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MovieVoteRepository extends JpaRepository<MovieVote, Long> {

    Optional<MovieVote> findByMovie(Movie movie);

    //Query que me trae la peli con mas votos, en caso de empate me trae la primera que encuentre
    @Query(value = "SELECT * FROM movies m JOIN movie_votes mv ON m.id = mv.movie_id ORDER BY mv.vote DESC LIMIT 1", nativeQuery = true)
    MovieVote findTopMovie();
}
