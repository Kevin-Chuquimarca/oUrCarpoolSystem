package ec.edu.espe.tripsservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TripLocationDTO {
    LocationDTO location;
    TripDTO trip;
}
