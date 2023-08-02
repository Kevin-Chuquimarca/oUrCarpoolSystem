package ec.edu.espe.TripsService.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TripDTO {
    private long id;
    private int idDri;
    private Time leaveHour;
    private Date date;
    private Time arrivalHour;
    private Byte available;
    private BigDecimal priceAll;
}
