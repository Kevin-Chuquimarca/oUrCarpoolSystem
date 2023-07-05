package ec.edu.espe.StudentRegistration.controller;

import ec.edu.espe.StudentRegistration.dto.UniversityDTO;
import ec.edu.espe.StudentRegistration.service.UniversityService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/university")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class UniversityController {
    private final UniversityService universityService;

    @GetMapping("/{id}")
    public ResponseEntity<UniversityDTO> getUniversity(@PathVariable Integer id) {
        Optional<UniversityDTO> universityDTOOptional = universityService.read(id);
        return universityDTOOptional.map(universityDTO -> ResponseEntity.status(HttpStatus.OK).body(universityDTO)).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body(null));
    }

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<UniversityDTO> getAllUniversities() {
        return universityService.readAll();
    }

    @PostMapping
    public ResponseEntity<UniversityDTO> saveUniversity(@RequestBody UniversityDTO universityDTO) {
        UniversityDTO university = universityService.create(universityDTO);
        return (university != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(university)
                :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    }

    @PutMapping("/{id}")
    public ResponseEntity<UniversityDTO> updateUniversity(@PathVariable Integer id, @RequestBody UniversityDTO universityDTO) {
        UniversityDTO university = universityService.update(id, universityDTO);
        return (university != null) ?
                ResponseEntity.status(HttpStatus.OK).body(university)
                :
                ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteUniversity(@PathVariable Integer id) {
        universityService.delete(id);
    }
}
