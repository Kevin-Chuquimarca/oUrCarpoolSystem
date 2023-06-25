package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.UniversityDTO;
import ec.edu.espe.StudentRegistration.entity.UniversityEntity;
import ec.edu.espe.StudentRegistration.repository.UniversityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UniversityService {
    private final UniversityRepository universityRepository;

    public UniversityDTO getUniversityById(Integer id){
        UniversityEntity university = universityRepository.findById(id).orElse(null);
        assert university != null;
        return new UniversityDTO(university.getNameUni(), university.getEmailDomainUni());
    }

    public List<UniversityEntity> getAllUniversities() {
        return universityRepository.findAll();
    }

    public void saveUniversity(UniversityDTO universityDTO) {
        UniversityEntity university = new UniversityEntity(universityDTO.getNameUni(), universityDTO.getEmailDomainUni());
        universityRepository.save(university);
    }

    public void updateUniversity(Integer id, UniversityDTO universityDTO) {
        UniversityEntity university = new UniversityEntity(id, universityDTO.getNameUni(), universityDTO.getEmailDomainUni());
        universityRepository.save(university);
    }

    public void deleteUniversity(Integer id){
        universityRepository.deleteById(id);
    }
}
