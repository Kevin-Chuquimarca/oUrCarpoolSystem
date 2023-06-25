package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Arrays;
import java.util.Objects;

@Entity
@Table(name = "USER", schema = "student_registration_db")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class UserEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID_USER")
    private int idUser;
    @Basic
    @Column(name = "ID_UNI")
    private int idUni;
    @Basic
    @Column(name = "EMAIL_USER")
    private String emailUser;
    @Basic
    @Column(name = "NAME_USER")
    private String nameUser;
    @Basic
    @Column(name = "LASTNAME_USER")
    private String lastnameUser;
    @Basic
    @Column(name = "PASS_USER")
    private String passUser;
    @Basic
    @Column(name = "PHONE_USER")
    private String phoneUser;
    @Basic
    @Column(name = "PHOTO_USER")
    private byte[] photoUser;
    @Basic
    @Column(name = "CAREER_USER")
    private String careerUser;

    public UserEntity(int idUni, String emailUser, String nameUser, String lastnameUser, String passUser, String phoneUser, byte[] photoUser, String careerUser) {
        this.idUni = idUni;
        this.emailUser = emailUser;
        this.nameUser = nameUser;
        this.lastnameUser = lastnameUser;
        this.passUser = passUser;
        this.phoneUser = phoneUser;
        this.photoUser = photoUser;
        this.careerUser = careerUser;
    }
}
