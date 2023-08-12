package ec.edu.espe.TripsService.controller;

import ec.edu.espe.TripsService.dto.RequestDTO;
import ec.edu.espe.TripsService.service.RequestDriverService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/request-driver")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class RequestDriverController {
    private final RequestDriverService requestDriverService;

    @GetMapping("/all/{idDri}")
    public ResponseEntity<List<RequestDTO>> getAll(@PathVariable Long idDri){
        return ResponseEntity.ok(requestDriverService.readAllByIdDri(idDri));
    }
}
