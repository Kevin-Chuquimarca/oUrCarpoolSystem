package ec.edu.espe.TripsService.controller;

import ec.edu.espe.TripsService.dto.RouteDTO;
import ec.edu.espe.TripsService.service.RouteService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/route")
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
