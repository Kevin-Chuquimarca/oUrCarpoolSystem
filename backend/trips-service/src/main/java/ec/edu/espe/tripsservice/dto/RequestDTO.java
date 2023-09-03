package ec.edu.espe.tripsservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestDTO {
    private long id;
    private int idDri;
    private int idPas;
    private String nameU;
    private String lastNameU;
    private String phoneU;
    private Date date;
    private String state;
}
