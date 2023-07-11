package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "user", schema = "student_registration_db")
@Data
@AllArgsConstructor
@NoArgsConstructor
@NamedQueries(
        {@NamedQuery(name = "UserEntity.findByEmail", query = "SELECT u FROM UserEntity u WHERE u.emailUser = :emailUser"),
                @NamedQuery(name = "UserEntity.findByCI", query = "SELECT u FROM UserEntity u WHERE u.ciUser = :ciUser")}
)
public class UserEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_user", nullable = false)
    private int idUser;
    @Basic
    @Column(name = "id_uni", nullable = false)
    private int idUni;
    @Basic
    @Column(name = "id_rl", nullable = false, length = 3)
    private String idRl;
    @Basic
    @Column(name = "ci_user", nullable = false, length = 10)
    private String ciUser;
    @Basic
    @Column(name = "email_user", nullable = false, length = 30)
    private String emailUser;
    @Basic
    @Column(name = "name_user", nullable = false, length = 20)
    private String nameUser;
    @Basic
    @Column(name = "last_name_user", nullable = false, length = 20)
    private String lastNameUser;
    @Basic
    @Column(name = "pass_user", nullable = false, length = 60)
    private String passUser;
    @Basic
    @Column(name = "phone_user", nullable = false, length = 10)
    private String phoneUser;
    @Basic
    @Column(name = "photo_user", nullable = false, length = 30)
    private String photoUser;
    @Basic
    @Column(name = "career_user", nullable = false, length = 30)
    private String careerUser;
    @Basic
    @Column(name = "first_login_user", nullable = false)
    private boolean firstLoginUser;

    public UserEntity(int idUni, String idRl, String ciUser, String emailUser, String nameUser, String lastNameUser, String passUser, String phoneUser, String photoUser, String careerUser, boolean firstLogin) {
        this.idUni = idUni;
        this.idRl = idRl;
        this.ciUser = ciUser;
        this.emailUser = emailUser;
        this.nameUser = nameUser;
        this.lastNameUser = lastNameUser;
        this.passUser = passUser;
        this.phoneUser = phoneUser;
        this.photoUser = photoUser;
        this.careerUser = careerUser;
        this.firstLoginUser = firstLogin;
    }
}
