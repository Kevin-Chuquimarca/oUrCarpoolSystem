package ec.edu.espe.tripsservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DriverDTO {
    private int id;
    private Long idLoc;
    private String plateCar;
    private String photoCar;
    private Integer codUser;
}
