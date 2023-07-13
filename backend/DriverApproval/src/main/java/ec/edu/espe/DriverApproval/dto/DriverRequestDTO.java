package ec.edu.espe.DriverApproval.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DriverRequestDTO {
    private int id;
    private int idAd;
    private String email;
    private Date shippingDate;
    private Date approvalDate;
    private String typeLic;
    private Date expiryDateLic;
    private String photoLic;
    private String plateCar;
    private String photoCar;
    private String state;
    private String message;
}
