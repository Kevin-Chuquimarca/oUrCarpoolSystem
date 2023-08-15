package ec.edu.espe.TripsService.service;

import ec.edu.espe.TripsService.dto.TripDTO;
import ec.edu.espe.TripsService.entity.TripEntity;
import ec.edu.espe.TripsService.mapper.TripMapper;
import ec.edu.espe.TripsService.repository.TripRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TripService implements FacadeService<TripDTO, Long> {
    private final TripRepository tripRepository;

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

    public boolean haveAvailableTrip(int idDri){
        return !tripRepository.findAllByIdDriAndAvailableTrip(idDri).isEmpty();
    }
}
