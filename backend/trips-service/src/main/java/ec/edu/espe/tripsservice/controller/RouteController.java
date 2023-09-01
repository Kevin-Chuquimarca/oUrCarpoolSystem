package ec.edu.espe.tripsservice.controller;

import ec.edu.espe.tripsservice.dto.RouteDTO;
import ec.edu.espe.tripsservice.service.RouteService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/route")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class RouteController {
    private final RouteService routeService;

    @GetMapping("/{idTrip}")
    @ResponseStatus(HttpStatus.OK)
    public RouteDTO create(@PathVariable long idTrip){
        return routeService.create(idTrip);
    }
}
