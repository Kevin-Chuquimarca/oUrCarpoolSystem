package ec.edu.espe.TripsService.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RouteDTO {
    List<LocationDTO> locations;
}
