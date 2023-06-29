package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.UniversityDTO;
import ec.edu.espe.StudentRegistration.entity.UniversityEntity;
import ec.edu.espe.StudentRegistration.repository.UniversityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UniversityService implements FacadeService<UniversityDTO, Integer>{
    private final UniversityRepository universityRepository;

    @Override
    public UniversityDTO create(UniversityDTO universityDTO) {
        UniversityEntity university = new UniversityEntity(universityDTO.getName(), universityDTO.getEmailDomain());
        universityRepository.save(university);
        return universityDTO;
    }

    @Override
    public Optional<UniversityDTO> read(Integer id) {
        Optional<UniversityEntity> university = universityRepository.findById(id);
        if(university.isPresent()){
            UniversityEntity universityEntity = university.get();
            return Optional.of(new UniversityDTO(universityEntity.getIdUni(), universityEntity.getNameUni(), universityEntity.getEmailDomainUni()));
        }
        return Optional.empty();
    }

    @Override
    public List<UniversityDTO> readAll() {
        List<UniversityEntity> universities = universityRepository.findAll();
        List<UniversityDTO> universitiesDTO = new ArrayList<>();
        for (UniversityEntity university : universities) {
            universitiesDTO.add(new UniversityDTO(university.getIdUni(), university.getNameUni(), university.getEmailDomainUni()));
        }
        return universitiesDTO;
    }

    @Override
    public UniversityDTO update(Integer id, UniversityDTO universityDTO) {
        UniversityEntity university = new UniversityEntity(id, universityDTO.getName(), universityDTO.getEmailDomain());
        universityRepository.save(university);
        return universityDTO;
    }

    @Override
    public void delete(Integer id) {
        universityRepository.deleteById(id);
    }
}
