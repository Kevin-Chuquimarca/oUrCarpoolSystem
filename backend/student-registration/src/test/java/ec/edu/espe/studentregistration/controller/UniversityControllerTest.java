package ec.edu.espe.studentregistration.controller;

import ec.edu.espe.studentregistration.dto.UniversityDTO;
import ec.edu.espe.studentregistration.service.UniversityService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.openMocks;

class UniversityControllerTest {
    @Mock
    private UniversityService universityService;

    @InjectMocks
    private UniversityController universityController;

    @BeforeEach
    public void setup() {
        openMocks(this);
    }

    @Test
    public void testGetUniversity_ValidId() {
        int universityId = 1;
        UniversityDTO expectedUniversity = new UniversityDTO(universityId, "University 1", "example.com");
        when(universityService.readById(universityId)).thenReturn(Optional.of(expectedUniversity));
        ResponseEntity<UniversityDTO> response = universityController.getById(universityId);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(expectedUniversity, response.getBody());
    }

    @Test
    public void testGetUniversity_InvalidId() {
        int universityId = 1;
        when(universityService.readById(universityId)).thenReturn(Optional.empty());
        ResponseEntity<UniversityDTO> response = universityController.getById(universityId);
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    public void testGetAllUniversities() {
        List<UniversityDTO> expectedUniversities = Arrays.asList(
                new UniversityDTO(1, "University 1", "example.com"),
                new UniversityDTO(2, "University 2", "example.org")
        );
        when(universityService.readAll()).thenReturn(expectedUniversities);
        List<UniversityDTO> universities = universityController.getAll();
        assertEquals(expectedUniversities, universities);
    }

    @Test
    public void testSaveUniversity_ValidUniversity() {
        UniversityDTO universityToSave = new UniversityDTO(1, "University 1", "example.com");
        UniversityDTO savedUniversity = new UniversityDTO(1, "University 1", "example.com");
        when(universityService.create(universityToSave)).thenReturn(savedUniversity);
        ResponseEntity<UniversityDTO> response = universityController.post(universityToSave);
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        assertEquals(savedUniversity, response.getBody());
    }

    @Test
    public void testSaveUniversity_InvalidUniversity() {
        UniversityDTO universityToSave = new UniversityDTO(1, "University 1", "example.com");
        when(universityService.create(universityToSave)).thenReturn(null);
        ResponseEntity<UniversityDTO> response = universityController.post(universityToSave);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    public void testPutUniversity_ValidUniversity() {
        int universityId = 1;
        UniversityDTO universityToUpdate = new UniversityDTO(universityId, "University Updated", "example.com");
        UniversityDTO updatedUniversity = new UniversityDTO(universityId, "University Updated", "example.com");
        when(universityService.update(universityId, universityToUpdate)).thenReturn(updatedUniversity);
        ResponseEntity<UniversityDTO> response = universityController.putById(universityId, universityToUpdate);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(updatedUniversity, response.getBody());
    }

    @Test
    public void testPutUniversity_InvalidUniversity() {
        int universityId = 1;
        UniversityDTO universityToUpdate = new UniversityDTO(universityId, "University Updated", "example.com");
        when(universityService.update(universityId, universityToUpdate)).thenReturn(null);
        ResponseEntity<UniversityDTO> response = universityController.putById(universityId, universityToUpdate);
        assertEquals(HttpStatus.NO_CONTENT, response.getStatusCode());
        assertNull(response.getBody());
    }
}