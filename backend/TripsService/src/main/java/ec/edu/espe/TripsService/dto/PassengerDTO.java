package ec.edu.espe.TripsService.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PassengerDTO {
    private int id;
    private Long idTrip;
    private Long idLoc;
    private Integer codUser;
}
