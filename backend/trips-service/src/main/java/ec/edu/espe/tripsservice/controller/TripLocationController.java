package ec.edu.espe.tripsservice.controller;

import ec.edu.espe.tripsservice.dto.TripLocationDTO;
import ec.edu.espe.tripsservice.service.TripLocationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/trip-location")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class TripLocationController {
    private final TripLocationService tripLocationService;

    @PostMapping
    public ResponseEntity<String> postTripLocation(@RequestBody TripLocationDTO tripLocationDTO){
        if (tripLocationService.createTripLocation(tripLocationDTO)){
            return ResponseEntity.status(HttpStatus.CREATED).build();
        }
        return ResponseEntity.badRequest().build();
    }
}
