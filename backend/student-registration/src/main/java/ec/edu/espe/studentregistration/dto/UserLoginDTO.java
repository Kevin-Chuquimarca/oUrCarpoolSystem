package ec.edu.espe.studentregistration.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserLoginDTO {
    private String email;
    private String password;
}
