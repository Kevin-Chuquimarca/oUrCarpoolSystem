package ec.edu.espe.tripsservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Time;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TripDTO {
    private long id;
    private int idDri;
    private Long idLoc;
    private Time leaveHour;
    private Date date;
    private Byte available;
    private int freeSeats;
    private String typeTrip;
}
