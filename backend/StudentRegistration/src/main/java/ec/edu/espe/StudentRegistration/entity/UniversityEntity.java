package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Objects;

@Entity
@Table(name = "university", schema = "student_registration_db")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class UniversityEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_uni")
    public int idUni;
    @Basic
    @Column(name = "name_uni")
    public String nameUni;
    @Basic
    @Column(name = "email_domain_uni")
    public String emailDomainUni;

    public UniversityEntity(String nameUni, String emailDomainUni) {
        this.nameUni = nameUni;
        this.emailDomainUni = emailDomainUni;
    }
}
