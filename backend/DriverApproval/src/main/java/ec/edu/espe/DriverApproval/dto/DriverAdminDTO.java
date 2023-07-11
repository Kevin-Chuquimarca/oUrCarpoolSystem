package ec.edu.espe.DriverApproval.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DriverAdminDTO {
    private int id;
    private String name;
    private String lastName;
    private String email;
    private String phone;
}
