package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.OptionRoleDTO;
import ec.edu.espe.StudentRegistration.entity.OptionRoleEntity;
import ec.edu.espe.StudentRegistration.mapper.OptionRoleMapper;
import ec.edu.espe.StudentRegistration.repository.RoleOptionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoleOptionService {
    private final RoleOptionRepository roleOptionRepository;

    public List<OptionRoleDTO> readOptionsByRole(String idRl) {
        List<OptionRoleEntity> options = roleOptionRepository.findOptionByIdRl(idRl);
        return options.stream().map(OptionRoleMapper.INSTANCE::toOptionRoleDTO).toList();
    }
}
