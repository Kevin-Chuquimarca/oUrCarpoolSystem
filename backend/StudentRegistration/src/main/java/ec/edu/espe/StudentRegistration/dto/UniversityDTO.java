package ec.edu.espe.StudentRegistration.dto;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UniversityDTO {
    private String nameUni;
    private String emailDomainUni;
}
