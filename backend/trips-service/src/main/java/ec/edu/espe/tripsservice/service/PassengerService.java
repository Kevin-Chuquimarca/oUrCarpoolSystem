package ec.edu.espe.tripsservice.service;

import ec.edu.espe.tripsservice.dto.LocationDTO;
import ec.edu.espe.tripsservice.dto.PassengerDTO;
import ec.edu.espe.tripsservice.entity.PassengerEntity;
import ec.edu.espe.tripsservice.mapper.PassengerMapper;
import ec.edu.espe.tripsservice.repository.PassengerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PassengerService implements FacadeService<PassengerDTO, Integer> {
    private final PassengerRepository passengerRepository;
    private final LocationService locationService;

    @Override
    public PassengerDTO create(PassengerDTO passengerDTO) {
        LocationDTO locationDTO = locationService.create(new LocationDTO(0,new BigDecimal("0.0"),new BigDecimal("0.0"),"Passenger House"));
        passengerDTO.setIdLoc(locationDTO.getId());
        PassengerEntity passengerSaved = passengerRepository.save(PassengerMapper.INSTANCE.toPassengerEntity(passengerDTO));
        return PassengerMapper.INSTANCE.toPassengerDTO(passengerSaved);
    }

    @Override
    public Optional<PassengerDTO> readById(Integer id) {
        return passengerRepository.findById(id).map(PassengerMapper.INSTANCE::toPassengerDTO);
    }

    @Override
    public List<PassengerDTO> readAll() {
        return null;
    }

    @Override
    public PassengerDTO update(Integer id, PassengerDTO passengerDTO) {
        if (passengerRepository.findById(id).isPresent()){
            passengerDTO.setId(id);
            PassengerEntity passengerUpdated = passengerRepository.save(PassengerMapper.INSTANCE.toPassengerEntity(passengerDTO));
            return PassengerMapper.INSTANCE.toPassengerDTO(passengerUpdated);
        }
        return null;
    }

    @Override
    public void deleteById(Integer id) {
        passengerRepository.deleteById(id);
    }

    public List<PassengerDTO> readAllByIdTrip(long idTrip){
        return passengerRepository.findAllByIdTrip(idTrip).stream().map(PassengerMapper.INSTANCE::toPassengerDTO).toList();
    }
}
