package ec.edu.espe.tripsservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DriverTripRouteDTO {
    DriverDTO driver;
    TripDTO trip;
    LocationDTO startLocation;
    LocationDTO endLocation;
}
