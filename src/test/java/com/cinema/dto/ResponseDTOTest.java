package com.cinema.dto;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;

import static org.junit.jupiter.api.Assertions.*;

class ResponseDTOTest {

    @Test
    void testFullConstructor() {
        ResponseDTO responseDTO = new ResponseDTO(HttpStatus.OK, "description", new MovieDTO());

        assertEquals(HttpStatus.OK, responseDTO.getStatus());
        assertEquals("description", responseDTO.getDescription());
        assertEquals(MovieDTO.class, responseDTO.getContent().getClass());
    }

    @Test
    void testConstructor() {
        ResponseDTO responseDTO = new ResponseDTO(HttpStatus.OK, "description");

        assertEquals(HttpStatus.OK, responseDTO.getStatus());
        assertEquals("description", responseDTO.getDescription());
    }


    @Test
    void setAndGeStatus() {
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setStatus(HttpStatus.OK);

        assertEquals(HttpStatus.OK, responseDTO.getStatus());
    }

    @Test
    void setAndGetContent() {
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setContent("content");

        assertEquals("content", responseDTO.getContent());
    }

    @Test
    void setAndGetDescription() {
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setDescription("description");

        assertEquals("description", responseDTO.getDescription());
    }
}