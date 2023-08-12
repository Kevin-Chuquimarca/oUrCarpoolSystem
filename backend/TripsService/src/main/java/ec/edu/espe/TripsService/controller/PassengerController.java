package ec.edu.espe.TripsService.controller;

import ec.edu.espe.TripsService.dto.PassengerDTO;
import ec.edu.espe.TripsService.service.PassengerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/passenger")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class PassengerController {
    private final PassengerService passengerService;

    @GetMapping("/{id}")
    public ResponseEntity<PassengerDTO> getById(@PathVariable Integer id){
        return passengerService.readById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<PassengerDTO> post(@RequestBody PassengerDTO passengerDTO){
        PassengerDTO passengerCreated = passengerService.create(passengerDTO);
        return (passengerCreated != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(passengerCreated) :
                ResponseEntity.badRequest().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<PassengerDTO> put(@RequestBody PassengerDTO passengerDTO, @PathVariable Integer id){
        PassengerDTO passengerUpdated = passengerService.update(id, passengerDTO);
        return (passengerUpdated != null) ?
                ResponseEntity.ok(passengerUpdated) :
                ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void delete(@PathVariable Integer id){
        passengerService.deleteById(id);
    }
}
