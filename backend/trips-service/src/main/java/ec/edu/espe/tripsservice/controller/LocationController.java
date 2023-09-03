package ec.edu.espe.tripsservice.controller;

import ec.edu.espe.tripsservice.dto.LocationDTO;
import ec.edu.espe.tripsservice.service.LocationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/location")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class LocationController {
    private final LocationService locationService;

    @GetMapping("/{id}")
    public ResponseEntity<LocationDTO> getLocationById(@PathVariable Long id) {
        return locationService.readById(id).map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<LocationDTO> postLocation(@RequestBody LocationDTO locationDTO){
        LocationDTO locationCreated = locationService.create(locationDTO);
        return (locationCreated != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(locationCreated) :
                ResponseEntity.badRequest().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<LocationDTO> putLocation(@RequestBody LocationDTO locationDTO, @PathVariable Long id){
        LocationDTO locationUpdated = locationService.update(id, locationDTO);
        return (locationUpdated != null) ?
                ResponseEntity.ok(locationUpdated) :
                ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<LocationDTO> deleteLocation(@PathVariable Long id){
        locationService.deleteById(id);
        return ResponseEntity.ok().build();
    }
}
