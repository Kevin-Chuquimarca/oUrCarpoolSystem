package ec.edu.espe.TripsService.controller;

import ec.edu.espe.TripsService.dto.DriverTripRouteDTO;
import ec.edu.espe.TripsService.service.DriverTripRouteService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/driver-trip-route")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class DriverTripRouteController {
    private final DriverTripRouteService driverTripRouteService;

    @GetMapping("/available/all")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<List<DriverTripRouteDTO>> getAllAvailableTrips(){
        return ResponseEntity.ok(driverTripRouteService.readAllAvailableTrips());
    }
}
