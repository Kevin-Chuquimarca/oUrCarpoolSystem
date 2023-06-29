package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "user", schema = "student_registration_db")
@NamedQueries(
        @NamedQuery(name = "UserEntity.findByEmail", query = "SELECT u FROM UserEntity u WHERE u.emailUser = :emailUser")
)
public class UserEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_user")
    private int idUser;
    @Basic
    @Column(name = "id_uni")
    private int idUni;
    @Basic
    @Column(name = "ci_user")
    private String ciUser;
    @Basic
    @Column(name = "email_user")
    private String emailUser;
    @Basic
    @Column(name = "name_user")
    private String nameUser;
    @Basic
    @Column(name = "last_name_user")
    private String lastNameUser;
    @Basic
    @Column(name = "pass_user")
    private String passUser;
    @Basic
    @Column(name = "phone_user")
    private String phoneUser;
    @Basic
    @Column(name = "photo_user")
    private String photoUser;
    @Basic
    @Column(name = "career_user")
    private String careerUser;

    public UserEntity(int idUni, String ciUser, String emailUser, String nameUser, String lastNameUser, String passUser, String phoneUser, String photoUser, String careerUser) {
        this.idUni = idUni;
        this.ciUser = ciUser;
        this.emailUser = emailUser;
        this.nameUser = nameUser;
        this.lastNameUser = lastNameUser;
        this.passUser = passUser;
        this.phoneUser = phoneUser;
        this.photoUser = photoUser;
        this.careerUser = careerUser;
    }
}
