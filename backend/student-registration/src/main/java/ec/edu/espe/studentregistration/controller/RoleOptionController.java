package ec.edu.espe.studentregistration.controller;

import ec.edu.espe.studentregistration.dto.OptionRoleDTO;
import ec.edu.espe.studentregistration.service.RoleOptionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("v1/role-option")
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
