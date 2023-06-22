package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.entity.UniversityEntity;
import ec.edu.espe.StudentRegistration.repository.UniversityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UniversityService {
    private final UniversityRepository universityRepository;

    public UniversityEntity getUniversityById(Integer id){
        return universityRepository.findById(id).orElse(null);
    }
}
