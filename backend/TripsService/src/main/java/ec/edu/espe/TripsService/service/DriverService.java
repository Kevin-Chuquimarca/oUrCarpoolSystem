package ec.edu.espe.TripsService.service;

import ec.edu.espe.TripsService.dto.DriverDTO;
import ec.edu.espe.TripsService.entity.DriverEntity;
import ec.edu.espe.TripsService.mapper.DriverMapper;
import ec.edu.espe.TripsService.repository.DriverRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DriverService implements FacadeService<DriverDTO, Integer> {
    private final DriverRepository driverRepository;

    @Override
    public DriverDTO create(DriverDTO driverDTO) {
        DriverEntity driverSaved = driverRepository.save(DriverMapper.INSTANCE.toDriverEntity(driverDTO));
        return DriverMapper.INSTANCE.toDriverDTO(driverSaved);
    }

    @Override
    public Optional<DriverDTO> readById(Integer id) {
        return driverRepository.findById(id).map(DriverMapper.INSTANCE::toDriverDTO);
    }

    @Override
    public List<DriverDTO> readAll() {
        return driverRepository.findAll().stream().map(DriverMapper.INSTANCE::toDriverDTO).toList();
    }

    @Override
    public DriverDTO update(Integer id, DriverDTO driverEntity) {
        if (driverRepository.findById(id).isPresent()) {
            driverEntity.setId(id);
            DriverEntity driverUpdated = driverRepository.save(DriverMapper.INSTANCE.toDriverEntity(driverEntity));
            return DriverMapper.INSTANCE.toDriverDTO(driverUpdated);
        }
        return null;
    }

    @Override
    public void deleteById(Integer id) {
        driverRepository.deleteById(id);
    }
}
