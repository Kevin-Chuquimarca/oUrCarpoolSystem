package ec.edu.espe.studentregistration.service;

import ec.edu.espe.studentregistration.dto.UniversityDTO;
import ec.edu.espe.studentregistration.entity.UniversityEntity;
import ec.edu.espe.studentregistration.repository.UniversityRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

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
    void readById(){
        UniversityEntity university = new UniversityEntity(1, "ESPE", "espe.edu.ec");
        when(universityRepository.findById(1)).thenReturn(java.util.Optional.of(university));
        Optional<UniversityDTO> uni = universityService.readById(1);
        uni.ifPresent(universityDTO -> assertEquals(university.getIdUni(), universityDTO.getId()));
    }

    @Test
    void readAll(){
        List<UniversityEntity> universities = new ArrayList<>();
        universities.add(new UniversityEntity(1, "ESPE", "espe.edu.ec"));
        universities.add(new UniversityEntity(3, "UTPL", "utpl.edu.ec"));
        universities.add(new UniversityEntity(3, "UTA", "uta.edu.ec"));
        universities.add(new UniversityEntity(2, "UDLA", "udla.edu.ec"));
        when(universityRepository.findAll()).thenReturn(universities);
        List<UniversityDTO> unis = universityService.readAll();
        assertEquals(universities.size(), unis.size());
    }

    @Test
    void create(){
        UniversityEntity university = new UniversityEntity("ESPE", "espe.edu.ec");
        when(universityRepository.save(university)).thenReturn(university);
        UniversityDTO uni = universityService.create(new UniversityDTO(university.getIdUni(), university.getNameUni(), university.getEmailDomainUni()));
        assertEquals(university.getIdUni(), uni.getId());
    }

    @Test
    void update(){
        UniversityEntity university = new UniversityEntity(1, "ESPE", "espe2.edu.ec");
        when(universityRepository.save(university)).thenReturn(university);
        UniversityDTO uni = universityService.update(1, new UniversityDTO(university.getIdUni(), university.getNameUni(), university.getEmailDomainUni()));
        assertEquals(university.getEmailDomainUni(), uni.getEmailDomain());
    }

}
