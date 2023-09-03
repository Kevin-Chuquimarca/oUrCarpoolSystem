package ec.edu.espe.studentregistration.controller;

import ec.edu.espe.studentregistration.dto.UniversityDTO;
import ec.edu.espe.studentregistration.service.UniversityService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import lombok.RequiredArgsConstructor;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/v1/university")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class UniversityController {
    private final UniversityService universityService;

    @GetMapping("/{id}")
    public ResponseEntity<UniversityDTO> getById(@PathVariable Integer id) {
        Optional<UniversityDTO> universityDTOOptional = universityService.readById(id);
        return universityDTOOptional.map(universityDTO -> ResponseEntity.status(HttpStatus.OK).body(universityDTO)).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body(null));
    }

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<UniversityDTO> getAll() {
        return universityService.readAll();
    }

    @PostMapping
    public ResponseEntity<UniversityDTO> post(@RequestBody UniversityDTO universityDTO) {
        UniversityDTO university = universityService.create(universityDTO);
        return (university != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(university)
                :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    }

    @PutMapping("/{id}")
    public ResponseEntity<UniversityDTO> putById(@PathVariable Integer id, @RequestBody UniversityDTO universityDTO) {
        UniversityDTO university = universityService.update(id, universityDTO);
        return (university != null) ?
                ResponseEntity.status(HttpStatus.OK).body(university)
                :
                ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteById(@PathVariable Integer id) {
        universityService.deleteById(id);
    }
}
