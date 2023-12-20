package com.cinema.dto;

import com.cinema.models.Movie;
import com.cinema.models.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class VoteRequestDTO {
    private Long movieId;
    private int vote;

}
