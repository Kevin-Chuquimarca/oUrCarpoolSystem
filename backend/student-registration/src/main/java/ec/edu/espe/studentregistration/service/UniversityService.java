package ec.edu.espe.studentregistration.service;

import ec.edu.espe.studentregistration.dto.UniversityDTO;
import ec.edu.espe.studentregistration.entity.UniversityEntity;
import ec.edu.espe.studentregistration.mapper.UniversityMapper;
import ec.edu.espe.studentregistration.repository.UniversityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UniversityService implements FacadeService<UniversityDTO, Integer>{
    private final UniversityRepository universityRepository;

    @Override
    public UniversityDTO create(UniversityDTO universityDTO) {
        UniversityEntity university = UniversityMapper.INSTANCE.toUniversityEntity(universityDTO);
        return UniversityMapper.INSTANCE.toUniversityDTO(universityRepository.save(university));
    }

    @Override
    public Optional<UniversityDTO> readById(Integer id) {
        Optional<UniversityEntity> university = universityRepository.findById(id);
        if(university.isPresent()){
            UniversityEntity universityEntity = university.get();
            return Optional.of(UniversityMapper.INSTANCE.toUniversityDTO(universityEntity));
        }
        return Optional.empty();
    }

    @Override
    public List<UniversityDTO> readAll() {
        List<UniversityEntity> universities = universityRepository.findAll();
        return universities.stream().map(UniversityMapper.INSTANCE::toUniversityDTO).toList();
    }

    @Override
    public UniversityDTO update(Integer id, UniversityDTO universityDTO) {
        UniversityEntity university = UniversityMapper.INSTANCE.toUniversityEntity(universityDTO);
        return UniversityMapper.INSTANCE.toUniversityDTO(universityRepository.save(university));
    }

    @Override
    public void deleteById(Integer id) {
        universityRepository.deleteById(id);
    }
}
