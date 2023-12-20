package com.cinema.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "movies")
public class Movie {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        private String director;
        private String name;
        private Double duration;

        @OneToMany(mappedBy = "movie", cascade = CascadeType.ALL, orphanRemoval = true)
        @JsonIgnore
        private List<MovieVote> votes = new ArrayList<>();

}
