package ec.edu.espe.StudentRegistration.dto;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UniversityDTO {
    public int id;
    public String name;
    public String emailDomain;
}
