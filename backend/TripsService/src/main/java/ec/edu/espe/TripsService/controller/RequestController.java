package ec.edu.espe.TripsService.controller;

import ec.edu.espe.TripsService.dto.RequestDTO;
import ec.edu.espe.TripsService.service.RequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/request")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class RequestController {
    private final RequestService requestService;

    @GetMapping("{id}")
    public ResponseEntity<RequestDTO> getById(@PathVariable Long id) {
        return requestService.readById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<RequestDTO> post(@RequestBody RequestDTO requestDTO) {
        RequestDTO requestCreated = requestService.create(requestDTO);
        return (requestCreated != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(requestCreated) :
                ResponseEntity.badRequest().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<RequestDTO> put(@RequestBody RequestDTO requestDTO, @PathVariable Long id) {
        RequestDTO requestUpdated = requestService.update(id, requestDTO);
        return (requestUpdated != null) ?
                ResponseEntity.ok(requestUpdated) :
                ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void delete(@PathVariable Long id) {
        requestService.deleteById(id);
    }
}
