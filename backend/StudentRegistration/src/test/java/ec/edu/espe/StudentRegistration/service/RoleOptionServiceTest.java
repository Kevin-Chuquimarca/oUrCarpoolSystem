package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.OptionRoleDTO;
import ec.edu.espe.StudentRegistration.entity.OptionRoleEntity;
import ec.edu.espe.StudentRegistration.repository.RoleOptionRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

class RoleOptionServiceTest {

    @InjectMocks
    private RoleOptionService roleOptionService;

    @Mock
    private RoleOptionRepository roleOptionRepository;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void readOptionsByRole() {
        List<OptionRoleEntity> options = new ArrayList<>();
        options.add(new OptionRoleEntity("st", "see trips", "no description"));
        options.add(new OptionRoleEntity("ct", "create trips", "no description"));
        options.add(new OptionRoleEntity("dt", "delete trips", "no description"));
        when(roleOptionRepository.findOptionByIdRl("ct")).thenReturn(options);
        List<OptionRoleDTO> optionsByRole = roleOptionService.readOptionsByRole("ct");
        assertEquals(options.size(), optionsByRole.size());
    }
}