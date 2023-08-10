package com.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.http.HttpStatus;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ResponseDTO {

        private HttpStatus status;
        private Object content;
        private String description;

        public ResponseDTO(HttpStatus status, String description) {
             this.status = status;
             this.description = description;
        }
}
