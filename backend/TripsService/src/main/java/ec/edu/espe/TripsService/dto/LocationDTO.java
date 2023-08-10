package ec.edu.espe.TripsService.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LocationDTO {
    private long id;
    private BigDecimal lat;
    private BigDecimal lng;
    private String name;
}
