package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.UniversityDTO;
import ec.edu.espe.StudentRegistration.entity.UniversityEntity;
import ec.edu.espe.StudentRegistration.repository.UniversityRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.mockito.Mockito.when;

public class UniversityServiceTest {

    @InjectMocks
    private UniversityService universityService;
    @Mock
    private UniversityRepository universityRepository;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void read(){
        UniversityEntity university = new UniversityEntity(1, "ESPE", "espe.edu.ec");
        when(universityRepository.findById(1)).thenReturn(java.util.Optional.of(university));
        Optional<UniversityDTO> uni = universityService.read(1);
        uni.ifPresent(universityDTO -> Assertions.assertEquals(university.getIdUni(), universityDTO.getId()));
    }

    @Test
    void readAll(){
        List<UniversityEntity> universities = new ArrayList<>();
        universities.add(new UniversityEntity(1, "ESPE", "espe.edu.ec"));
        universities.add(new UniversityEntity(2, "UDLA", "udla.edu.ec"));
        universities.add(new UniversityEntity(3, "PUCE", "puce.edu.ec"));
        when(universityRepository.findAll()).thenReturn(universities);
        List<UniversityDTO> unis = universityService.readAll();
        Assertions.assertEquals(universities.size(), unis.size());
    }
}
