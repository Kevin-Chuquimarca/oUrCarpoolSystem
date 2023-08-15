package ec.edu.espe.TripsService.controller;

import ec.edu.espe.TripsService.dto.RequestDTO;
import ec.edu.espe.TripsService.service.RequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @GetMapping("/all/id-dri/{idDri}")
    public ResponseEntity<List<RequestDTO>> getAllByIdDri(@PathVariable Long idDri){
        return ResponseEntity.ok(requestService.readAllByIdDri(idDri));
    }

    @PutMapping("/accept/{id}")
    public ResponseEntity<Boolean> accept(@PathVariable Long id){
        if (requestService.accept(id)){
            return ResponseEntity.ok(true);
        } else{
            return ResponseEntity.noContent().build();
        }
    }

    @PutMapping("/deny/{id}")
    public ResponseEntity<Boolean> deny(@PathVariable Long id){
        if (requestService.deny(id)){
            return ResponseEntity.ok(true);
        } else{
            return ResponseEntity.noContent().build();
        }
    }
}
