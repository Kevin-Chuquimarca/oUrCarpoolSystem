package ec.edu.espe.StudentRegistration.controller;

import ec.edu.espe.StudentRegistration.dto.UniversityDTO;
import ec.edu.espe.StudentRegistration.service.UniversityService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/university")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class UniversityController {
    private final UniversityService universityService;

    @GetMapping("/id")
    @ResponseStatus(HttpStatus.OK)
    public UniversityDTO getUniversityById(Integer id){
        return universityService.getUniversityById(id);
    }

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<UniversityDTO> getAllUniversities(){
        return universityService.getAllUniversities();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public void saveUniversity(@RequestBody UniversityDTO universityDTO){
        universityService.saveUniversity(universityDTO);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updateUniversity(@PathVariable Integer id, @RequestBody UniversityDTO universityDTO){
        universityService.updateUniversity(id, universityDTO);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteUniversity(@PathVariable Integer id){
        universityService.deleteUniversity(id);
    }
}
