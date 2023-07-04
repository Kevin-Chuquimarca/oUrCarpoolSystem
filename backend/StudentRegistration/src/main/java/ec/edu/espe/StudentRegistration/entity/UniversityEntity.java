package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "university", schema = "student_registration_db")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UniversityEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_uni", nullable = false)
    private int idUni;
    @Basic
    @Column(name = "name_uni", nullable = false, length = 30)
    private String nameUni;
    @Basic
    @Column(name = "email_domain_uni", nullable = false, length = 15)
    private String emailDomainUni;

    public UniversityEntity(String nameUni, String emailDomainUni) {
        this.nameUni = nameUni;
        this.emailDomainUni = emailDomainUni;
    }
}
