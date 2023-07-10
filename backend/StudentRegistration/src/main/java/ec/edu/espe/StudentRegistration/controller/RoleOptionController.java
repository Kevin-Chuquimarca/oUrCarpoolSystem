package ec.edu.espe.StudentRegistration.controller;

import ec.edu.espe.StudentRegistration.dto.OptionRoleDTO;
import ec.edu.espe.StudentRegistration.service.RoleOptionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("role-option")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class RoleOptionController {
    private final RoleOptionService roleOptionService;

    @GetMapping("/options/{idRl}")
    @ResponseStatus(HttpStatus.OK)
    public List<OptionRoleDTO> getOptionsByRole(@PathVariable String idRl) {
        return roleOptionService.readOptionsByRole(idRl);
    }
}
