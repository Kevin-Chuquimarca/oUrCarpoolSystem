package ec.edu.espe.StudentRegistration.dto;

import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserLoginDTO {
    private String emailUser;
    private String passUser;
    private Boolean Access;
}
