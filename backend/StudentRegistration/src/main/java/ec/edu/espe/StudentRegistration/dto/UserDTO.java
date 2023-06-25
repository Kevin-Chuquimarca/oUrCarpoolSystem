package ec.edu.espe.StudentRegistration.dto;

import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private int idUni;
    private String emailUser;
    private String nameUser;
    private String lastnameUser;
    private String passUser;
    private String phoneUser;
//    private byte[] photoUser;
    private String careerUser;

    public UserDTO(String emailUser, String passUser) {
        this.emailUser = emailUser;
        this.passUser = passUser;
    }
}
