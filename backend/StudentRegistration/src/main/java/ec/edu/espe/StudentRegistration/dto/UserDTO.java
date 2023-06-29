package ec.edu.espe.StudentRegistration.dto;

import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private int id;
    private int idUni;
    private String ci;
    private String email;
    private String name;
    private String lastName;
    private String phone;
    private String photo;
    private String career;
}
