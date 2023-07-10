package ec.edu.espe.DriverApproval.service;

import ec.edu.espe.DriverApproval.dto.DriverRequestDTO;
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
        return null;
    }

    @Override
    public Optional<DriverRequestDTO> readById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public List<DriverRequestDTO> readAll() {
        return null;
    }

    @Override
    public DriverRequestDTO update(Integer integer, DriverRequestDTO driverRequestDTO) {
        return null;
    }

    @Override
    public void delete(Integer integer) {

    }
}
