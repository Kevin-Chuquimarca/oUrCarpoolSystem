package ec.edu.espe.TripsService.service;

import ec.edu.espe.TripsService.dto.LocationDTO;
import ec.edu.espe.TripsService.entity.LocationEntity;
import ec.edu.espe.TripsService.mapper.LocationMapper;
import ec.edu.espe.TripsService.repository.LocationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LocationService implements FacadeService<LocationDTO, Long> {
    private final LocationRepository locationRepository;


    @Override
    public LocationDTO create(LocationDTO locToUpdate) {
        LocationEntity locationSaved = locationRepository.save(LocationMapper.INSTANCE.toLocationEntity(locToUpdate));
        return LocationMapper.INSTANCE.toLocationDTO(locationSaved);
    }

    @Override
    public Optional<LocationDTO> readById(Long id) {
        return locationRepository.findById(id).map(LocationMapper.INSTANCE::toLocationDTO);
    }

    @Override
    public List<LocationDTO> readAll() {
        return null;
    }

    @Override
    public LocationDTO update(Long id, LocationDTO locToUpdate) {
        if (locationRepository.findById(id).isPresent()) {
            locToUpdate.setId(id);
            LocationEntity locationUpdated = locationRepository.save(LocationMapper.INSTANCE.toLocationEntity(locToUpdate));
            return LocationMapper.INSTANCE.toLocationDTO(locationUpdated);
        }
        return null;
    }

    @Override
    public void deleteById(Long id) {
        locationRepository.deleteById(id);
    }

    public List<LocationDTO> readAllByIdLocAndIdTrip(Long idLoc){
        return locationRepository.findAllByIdLocAndIdTrip(idLoc).stream().map(LocationMapper.INSTANCE::toLocationDTO).toList();
    }
}
