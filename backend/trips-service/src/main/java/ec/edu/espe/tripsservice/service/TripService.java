package ec.edu.espe.tripsservice.service;

import ec.edu.espe.tripsservice.dto.PassengerDTO;
import ec.edu.espe.tripsservice.dto.TripDTO;
import ec.edu.espe.tripsservice.entity.PassengerEntity;
import ec.edu.espe.tripsservice.entity.TripEntity;
import ec.edu.espe.tripsservice.mapper.TripMapper;
import ec.edu.espe.tripsservice.repository.TripRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TripService implements FacadeService<TripDTO, Long> {
    private final TripRepository tripRepository;
    private final PassengerService passengerService;

    @Override
    public TripDTO create(TripDTO tripDTO) {
        TripEntity tripSaved = tripRepository.save(TripMapper.INSTANCE.toTripEntity(tripDTO));
        return TripMapper.INSTANCE.toTripDTO(tripSaved);
    }

    @Override
    public Optional<TripDTO> readById(Long id) {
        return tripRepository.findById(id).map(TripMapper.INSTANCE::toTripDTO);
    }

    @Override
    public List<TripDTO> readAll() {
        return tripRepository.findAll().stream().map(TripMapper.INSTANCE::toTripDTO).toList();
    }

    @Override
    public TripDTO update(Long id, TripDTO tripDTO) {
        if (tripRepository.findById(id).isPresent()) {
            tripDTO.setId(id);
            TripEntity tripUpdated = tripRepository.save(TripMapper.INSTANCE.toTripEntity(tripDTO));
            return TripMapper.INSTANCE.toTripDTO(tripUpdated);
        }
        return null;
    }

    @Override
    public void deleteById(Long id) {
        tripRepository.deleteById(id);
    }

    public List<TripDTO> readAvailableTrips() {
        return tripRepository.findAllByAvailableTrip().stream().map(TripMapper.INSTANCE::toTripDTO).toList();
    }

    public Optional<TripDTO> readByIdDriAndAvailableTrip(int idDri){
        try{
            Optional<TripEntity> tripAvailable = tripRepository.findByIdDriAndAvailableTrip(idDri);
            if (tripAvailable.isPresent()){
            return tripAvailable.map(TripMapper.INSTANCE::toTripDTO);
        }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return Optional.empty();
    }

    public boolean finish(long id){
        Optional<TripEntity> trip = tripRepository.findById(id);
        if(trip.isPresent()){
            trip.get().setAvailableTrip(Byte.valueOf("0"));
            tripRepository.save(trip.get());
            List<PassengerDTO> passengers = passengerService.readAllByIdTrip(trip.get().getIdTrip());
            for (PassengerDTO passenger: passengers) {
                passenger.setIdTrip(null);
                passengerService.update(passenger.getId(), passenger);
            }
            return true;
        }
        return false;
    }
}
