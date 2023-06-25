package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "UNIVERSITY", schema = "student_registration_db")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class UniversityEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID_UNI")
    private int idUni;
    @Basic
    @Column(name = "NAME_UNI")
    private String nameUni;
    @Basic
    @Column(name = "EMAIL_DOMAIN_UNI")
    private String emailDomainUni;

    public UniversityEntity(String nameUni, String emailDomainUni) {
        this.nameUni = nameUni;
        this.emailDomainUni = emailDomainUni;
    }
}
