package ec.edu.espe.StudentRegistration.controller;

import ec.edu.espe.StudentRegistration.dto.UniversityDTO;
import ec.edu.espe.StudentRegistration.service.UniversityService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@RestController
@RequestMapping("/university")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class UniversityController {
    private final UniversityService universityService;

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public UniversityDTO getUniversity(@PathVariable Integer id){
        Optional<UniversityDTO> universityDTOOptional = universityService.read(id);
        if (universityDTOOptional.isPresent()) {
            return universityDTOOptional.get();
        }
        throw new NoSuchElementException("University not found");
    }

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<UniversityDTO> getAllUniversities(){
        return universityService.readAll();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public UniversityDTO saveUniversity(@RequestBody UniversityDTO universityDTO){
        return universityService.create(universityDTO);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public UniversityDTO updateUniversity(@PathVariable Integer id, @RequestBody UniversityDTO universityDTO){
        return universityService.update(id, universityDTO);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteUniversity(@PathVariable Integer id){
        universityService.delete(id);
    }
}
