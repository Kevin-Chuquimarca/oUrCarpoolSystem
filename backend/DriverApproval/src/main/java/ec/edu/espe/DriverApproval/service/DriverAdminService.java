package ec.edu.espe.DriverApproval.service;

import ec.edu.espe.DriverApproval.dto.DriverAdminDTO;
import ec.edu.espe.DriverApproval.entity.DriverAdminEntity;
import ec.edu.espe.DriverApproval.mapper.DriverAdminMapper;
import ec.edu.espe.DriverApproval.repository.DriverAdminRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DriverAdminService {
    private final DriverAdminRepository driverAdminRepository;

    public Optional<DriverAdminDTO> readById(Integer id) {
        Optional<DriverAdminEntity> adminEntity = driverAdminRepository.findById(id);
        return adminEntity.map(DriverAdminMapper.INSTANCE::toDriverAdminDTO);
    }

    public List<DriverAdminDTO> readAll() {
        List<DriverAdminEntity> adminsEntities = driverAdminRepository.findAll();
        return adminsEntities.stream().map(DriverAdminMapper.INSTANCE::toDriverAdminDTO).toList();
    }
}
