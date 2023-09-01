package ec.edu.espe.tripsservice.service;

import ec.edu.espe.tripsservice.dto.DriverDTO;
import ec.edu.espe.tripsservice.dto.DriverTripRouteDTO;
import ec.edu.espe.tripsservice.dto.LocationDTO;
import ec.edu.espe.tripsservice.dto.TripDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DriverTripRouteService {
    private final TripService tripService;
    private final LocationService locationService;
    private final DriverService driverService;

    public List<DriverTripRouteDTO> readAllAvailableTrips(){
        List<TripDTO> trips = tripService.readAvailableTrips();
        List<DriverTripRouteDTO> dtr = new ArrayList<>();
        Optional<DriverDTO> driver;
        Optional<LocationDTO> pointA = Optional.empty();
        Optional<LocationDTO> pointB;
        for (TripDTO trip: trips){
            driver = driverService.readById(trip.getIdDri());
            pointB = locationService.readById(trip.getIdLoc());
            if (driver.isPresent())
                pointA = locationService.readById(driver.get().getIdLoc());
            if (driver.isPresent() && pointA.isPresent() && pointB.isPresent())
                dtr.add((trip.getTypeTrip().equals("P"))? new DriverTripRouteDTO(driver.get(), trip, pointA.get(), pointB.get()): new DriverTripRouteDTO(driver.get(), trip, pointB.get(), pointA.get()));
        }
        return dtr;
    }
}
