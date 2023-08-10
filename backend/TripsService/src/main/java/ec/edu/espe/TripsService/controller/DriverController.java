package ec.edu.espe.TripsService.controller;

import ec.edu.espe.TripsService.dto.DriverDTO;
import ec.edu.espe.TripsService.entity.DriverEntity;
import ec.edu.espe.TripsService.repository.DriverRepository;
import ec.edu.espe.TripsService.service.DriverService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/driver")
@RequiredArgsConstructor
public class DriverController {
    private final DriverService driverService;
    private final DriverRepository driverRepository;

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<DriverDTO> getAllDrivers() {
        return driverService.readAll();
    }

    @GetMapping("/all2")
    public List<DriverEntity> getAllDriversEntity() {
        return driverRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<DriverDTO> getDriverById(@PathVariable Integer id) {
        return driverService.readById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<DriverDTO> postDriver(@RequestBody DriverDTO driverDTO) {
        DriverDTO driverCreated = driverService.create(driverDTO);
        return (driverCreated != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(driverCreated) :
                ResponseEntity.badRequest().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<DriverDTO> putDriver(@RequestBody DriverDTO driverDTO, @PathVariable Integer id) {
        DriverDTO driverUpdated = driverService.update(id, driverDTO);
        return (driverUpdated != null) ?
                ResponseEntity.ok(driverUpdated) :
                ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<DriverDTO> deleteDriver(@PathVariable Integer id) {
        driverService.deleteById(id);
        return ResponseEntity.ok().build();
    }
}
