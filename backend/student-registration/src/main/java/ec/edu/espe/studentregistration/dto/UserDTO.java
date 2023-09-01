package ec.edu.espe.studentregistration.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    private int id;
    private int idUni;
    private String idRl;
    private String ci;
    private String email;
    private String name;
    private String lastName;
    private String phone;
    private String photo;
    private String career;
    private boolean firstLogin;
}




