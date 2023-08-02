package ec.edu.espe.TripsService.dto;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DriverDTO {
    private int id;
    private String plateCar;
    private String modelCar;
    private String photoCar;
    private Integer numSeats;
    private Integer freeSeats;
    private Integer codUser;
}
