package ec.edu.espe.DriverApproval.service;

import ec.edu.espe.DriverApproval.dto.DriverRequestDTO;
import ec.edu.espe.DriverApproval.entity.DriverRequestEntity;
import ec.edu.espe.DriverApproval.mapper.DriverRequestMapper;
import ec.edu.espe.DriverApproval.repository.DriverRequestRepository;
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

    //TODO: implements this method
    @Override
    public DriverRequestDTO update(Integer id, DriverRequestDTO driverRequestDTO) {
        return null;
    }

    @Override
    public void deleteById(Integer id) {
        driverRequestRepository.deleteById(id);
    }
}
