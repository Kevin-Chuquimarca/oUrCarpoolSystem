package ec.edu.espe.TripsService.controller;

import ec.edu.espe.TripsService.dto.TripDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ec.edu.espe.TripsService.service.TripService;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/trip")
@RequiredArgsConstructor
public class TripController {
    private final TripService tripService;

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<TripDTO> getAllTrips() {
        return tripService.readAll();
    }

    @GetMapping("/available")
    @ResponseStatus(HttpStatus.OK)
    public List<TripDTO> getAvailableTrips() {
        return tripService.readAvailableTrips();
    }

    @GetMapping("/{id}")
    public ResponseEntity<TripDTO> getTripById(@PathVariable Long id) {
        return tripService.readById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<TripDTO> postTrip(@RequestBody TripDTO tripDTO) {
        TripDTO tripCreated = tripService.create(tripDTO);
        return (tripCreated != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(tripCreated) :
                ResponseEntity.badRequest().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<TripDTO> putTrip(@RequestBody TripDTO tripDTO, @PathVariable Long id) {
        TripDTO tripUpdated = tripService.update(id, tripDTO);
        return (tripUpdated != null) ?
                ResponseEntity.ok(tripUpdated) :
                ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<TripDTO> deleteTrip(@PathVariable Long id) {
        tripService.deleteById(id);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/have-available/{idDri}")
    public ResponseEntity<TripDTO> getAllByIdDri(@PathVariable int idDri){
        return tripService.readByIdDriAndAvailableTrip(idDri)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("finish/{id}")
    public ResponseEntity<Boolean> finish(@PathVariable Long id){
        if (tripService.finish(id)){
            return ResponseEntity.ok(true);
        } else{
            return ResponseEntity.noContent().build();
        }
    }
}
