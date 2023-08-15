package ec.edu.espe.TripsService.service;

import ec.edu.espe.TripsService.dto.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RouteService {
    private final TripService tripService;
    private final DriverService driverService;
    private final LocationService locationService;

    public RouteDTO create(long idTrip){
        RouteDTO routeDTO = new RouteDTO();
        try{
            List<LocationDTO> locations = new ArrayList<>();
            Optional<TripDTO> trip = tripService.readById(idTrip);
            if (trip.isPresent()){
                TripDTO t = trip.get();
                Optional<DriverDTO> driver = driverService.readById(t.getIdDri());
                if (t.getTypeTrip().equals("P")){
                    locations.add(locationService.readById(driver.get().getIdLoc()).get());
                    List<LocationDTO> l = locationService.readAllByIdLocAndIdTrip(t.getId());
                    locations.addAll(l);
                    locations.add(locationService.readById(t.getIdLoc()).get());
                }
                if (t.getTypeTrip().equals("R")){
                    locations.add(locationService.readById(t.getIdLoc()).get());
                    List<LocationDTO> l = locationService.readAllByIdLocAndIdTrip(t.getId());
                    locations.addAll(l);
                    locations.add(locationService.readById(driver.get().getIdLoc()).get());
                }
                routeDTO.setLocations(locations);
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return routeDTO;
    }
}
