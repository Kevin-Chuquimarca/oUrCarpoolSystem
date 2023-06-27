package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.UniversityDTO;
import ec.edu.espe.StudentRegistration.entity.UniversityEntity;
import ec.edu.espe.StudentRegistration.repository.UniversityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UniversityService {
    private final UniversityRepository universityRepository;

    public UniversityDTO getUniversityById(Integer id){
        UniversityEntity university = universityRepository.findById(id).orElse(null);
        assert university != null;
        return new UniversityDTO(university.getIdUni(), university.getNameUni(), university.getEmailDomainUni());
    }

    public List<UniversityDTO> getAllUniversities() {
        List<UniversityEntity> universities = universityRepository.findAll();
        List<UniversityDTO> universitiesDTO = new ArrayList<>();
        for (UniversityEntity university : universities) {
            universitiesDTO.add(new UniversityDTO(university.getIdUni(), university.getNameUni(), university.getEmailDomainUni()));
        }
        return universitiesDTO;
    }

    public void saveUniversity(UniversityDTO universityDTO) {
        UniversityEntity university = new UniversityEntity(universityDTO.getName(), universityDTO.getEmailDomain());
        universityRepository.save(university);
    }

    public void updateUniversity(Integer id, UniversityDTO universityDTO) {
        UniversityEntity university = new UniversityEntity(id, universityDTO.getName(), universityDTO.getEmailDomain());
        universityRepository.save(university);
    }

    public void deleteUniversity(Integer id){
        universityRepository.deleteById(id);
    }
}
