package ec.edu.espe.tripsservice.controller;

import ec.edu.espe.tripsservice.dto.DriverTripRouteDTO;
import ec.edu.espe.tripsservice.service.DriverTripRouteService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/driver-trip-route")
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
