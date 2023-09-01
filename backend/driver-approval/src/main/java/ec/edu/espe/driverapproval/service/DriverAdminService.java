package ec.edu.espe.driverapproval.service;

import ec.edu.espe.driverapproval.dto.DriverAdminDTO;
import ec.edu.espe.driverapproval.entity.DriverAdminEntity;
import ec.edu.espe.driverapproval.mapper.DriverAdminMapper;
import ec.edu.espe.driverapproval.repository.DriverAdminRepository;
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
