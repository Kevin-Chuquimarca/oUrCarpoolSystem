package ec.edu.espe.driverapproval.service;

import ec.edu.espe.driverapproval.dto.DriverRequestDTO;
import ec.edu.espe.driverapproval.entity.DriverRequestEntity;
import ec.edu.espe.driverapproval.mapper.DriverRequestMapper;
import ec.edu.espe.driverapproval.repository.DriverRequestRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DriverRequestService implements FacadeService<DriverRequestDTO, Integer> {
    private final DriverRequestRepository driverRequestRepository;

    @Override
    public DriverRequestDTO create(DriverRequestDTO driverRequestDTO) {
        DriverRequestEntity driverRequestEntity = DriverRequestMapper.INSTANCE.toDriverRequestEntity(driverRequestDTO);
        driverRequestEntity.setStateDr("P");
        DriverRequestEntity driverRequestSaved = driverRequestRepository.save(driverRequestEntity);
        return DriverRequestMapper.INSTANCE.toDriverRequestDTO(driverRequestSaved);
    }

    @Override
    public Optional<DriverRequestDTO> readById(Integer id) {
        Optional<DriverRequestEntity> driverRequestEntity = driverRequestRepository.findById(id);
        return driverRequestEntity.map(DriverRequestMapper.INSTANCE::toDriverRequestDTO);
    }

    @Override
    public List<DriverRequestDTO> readAll() {
        List<DriverRequestEntity> driverRequestEntities = driverRequestRepository.findAll();
        return driverRequestEntities.stream().map(DriverRequestMapper.INSTANCE::toDriverRequestDTO).toList();
    }

    @Override
    public DriverRequestDTO update(Integer id, DriverRequestDTO driverRequestDTO) {
        return null;
    }

    @Override
    public void deleteById(Integer id) {
        driverRequestRepository.deleteById(id);
    }

    public List<DriverRequestDTO> readAllPending() {
        List<DriverRequestEntity> driversRequest = driverRequestRepository.findByStateDr("P");
        return driversRequest.stream().map(DriverRequestMapper.INSTANCE::toDriverRequestDTO).toList();
    }

    public List<DriverRequestDTO> readAllApproved() {
        List<DriverRequestEntity> driversRequest = driverRequestRepository.findByStateDr("A");
        return driversRequest.stream().map(DriverRequestMapper.INSTANCE::toDriverRequestDTO).toList();
    }

    public List<DriverRequestDTO> readAllRejected() {
        List<DriverRequestEntity> driversRequest = driverRequestRepository.findByStateDr("R");
        return driversRequest.stream().map(DriverRequestMapper.INSTANCE::toDriverRequestDTO).toList();
    }
}
