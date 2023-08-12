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
    private final UserRestService userRestService;

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

    public boolean approveDriverRequest(Integer id, String message) {
        Optional<DriverRequestEntity> driverRequestEntity = driverRequestRepository.findById(id);
        if (driverRequestEntity.isPresent()) {
            DriverRequestEntity driverRequest = driverRequestEntity.get();
            driverRequest.setStateDr("A");
            driverRequest.setMessageDr(message);
            if (userRestService.changeUserRoleToDriver(driverRequest.getCodUserDr())){
                driverRequestRepository.save(driverRequest);
                return true;
            }
        }
        return false;
    }

    public boolean rejectDriverRequest(Integer id, String message) {
        Optional<DriverRequestEntity> driverRequestEntity = driverRequestRepository.findById(id);
        if (driverRequestEntity.isPresent()) {
            DriverRequestEntity driverRequest = driverRequestEntity.get();
            driverRequest.setStateDr("R");
            driverRequest.setMessageDr(message);
            driverRequestRepository.save(driverRequest);
            return true;
        }
        return false;
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
