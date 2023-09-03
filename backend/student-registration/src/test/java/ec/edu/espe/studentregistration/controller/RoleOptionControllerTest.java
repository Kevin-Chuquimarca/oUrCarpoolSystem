package ec.edu.espe.studentregistration.controller;

import ec.edu.espe.studentregistration.dto.OptionRoleDTO;
import ec.edu.espe.studentregistration.service.RoleOptionService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import java.util.Arrays;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.openMocks;

class RoleOptionControllerTest {
    @Mock
    private RoleOptionService roleOptionService;

    @InjectMocks
    private RoleOptionController roleOptionController;

    @BeforeEach
    public void setup() {
        openMocks(this);
    }

    @Test
    public void testGetOptionsByRole() {
        String roleId = "1";
        List<OptionRoleDTO> expectedOptions = Arrays.asList(
                new OptionRoleDTO("1", "Option 1"),
                new OptionRoleDTO("2", "Option 2")
        );
        when(roleOptionService.readOptionsByRole(roleId)).thenReturn(expectedOptions);
        List<OptionRoleDTO> actualOptions = roleOptionController.getOptionsByRole(roleId);
        assertEquals(expectedOptions, actualOptions);
    }
}