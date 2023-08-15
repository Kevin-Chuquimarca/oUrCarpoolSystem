package ec.edu.espe.TripsService.service;

import ec.edu.espe.TripsService.dto.PassengerDTO;
import ec.edu.espe.TripsService.entity.PassengerEntity;
import ec.edu.espe.TripsService.mapper.PassengerMapper;
import ec.edu.espe.TripsService.repository.PassengerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PassengerService implements FacadeService<PassengerDTO, Integer> {
    private final PassengerRepository passengerRepository;

    @Override
    public PassengerDTO create(PassengerDTO passengerDTO) {
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
