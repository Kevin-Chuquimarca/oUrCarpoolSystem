package ec.edu.espe.tripsservice.service;

import ec.edu.espe.tripsservice.dto.DriverDTO;
import ec.edu.espe.tripsservice.dto.LocationDTO;
import ec.edu.espe.tripsservice.entity.DriverEntity;
import ec.edu.espe.tripsservice.mapper.DriverMapper;
import ec.edu.espe.tripsservice.repository.DriverRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DriverService implements FacadeService<DriverDTO, Integer> {
    private final DriverRepository driverRepository;
    private final LocationService locationService;

    @Override
    public DriverDTO create(DriverDTO driverDTO) {
        if (driverDTO.getId() != 0) {
            LocationDTO locationDTO = locationService.create(new LocationDTO(0,new BigDecimal("0.0"),new BigDecimal("0.0"),""));
            driverDTO.setIdLoc(locationDTO.getId());
            DriverEntity driverSaved = driverRepository.save(DriverMapper.INSTANCE.toDriverEntity(driverDTO));
            return DriverMapper.INSTANCE.toDriverDTO(driverSaved);
        }
        return null;
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
