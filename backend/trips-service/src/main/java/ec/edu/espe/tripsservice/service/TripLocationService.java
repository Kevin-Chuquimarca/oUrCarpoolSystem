package ec.edu.espe.tripsservice.service;

import ec.edu.espe.tripsservice.dto.LocationDTO;
import ec.edu.espe.tripsservice.dto.TripDTO;
import ec.edu.espe.tripsservice.dto.TripLocationDTO;
import ec.edu.espe.tripsservice.entity.LocationEntity;
import ec.edu.espe.tripsservice.mapper.LocationMapper;
import ec.edu.espe.tripsservice.mapper.TripMapper;
import ec.edu.espe.tripsservice.repository.LocationRepository;
import ec.edu.espe.tripsservice.repository.TripRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TripLocationService {
    private final LocationRepository locationRepository;
    private final TripRepository tripRepository;

    public boolean createTripLocation(TripLocationDTO tripLocationDTO){
        LocationDTO locationDTO = tripLocationDTO.getLocation();
        TripDTO tripDTO = tripLocationDTO.getTrip();
        try {
            LocationEntity locationSaved = locationRepository.save(LocationMapper.INSTANCE.toLocationEntity(locationDTO));
            tripDTO.setIdLoc(locationSaved.getIdLoc());
            tripRepository.save(TripMapper.INSTANCE.toTripEntity(tripDTO));
            return true;
        } catch (Exception e) {
            System.out.println("Error to save TripLocation: " + e.getMessage());
            return false;
        }
    }
}
