package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.Arrays;
import java.util.Objects;

@Entity
@Table(name = "USER", schema = "our_carpool_db", catalog = "")
@NoArgsConstructor
@AllArgsConstructor
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

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdUni() {
        return idUni;
    }

    public void setIdUni(int idUni) {
        this.idUni = idUni;
    }

    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getLastnameUser() {
        return lastnameUser;
    }

    public void setLastnameUser(String lastnameUser) {
        this.lastnameUser = lastnameUser;
    }

    public String getPassUser() {
        return passUser;
    }

    public void setPassUser(String passUser) {
        this.passUser = passUser;
    }

    public String getPhoneUser() {
        return phoneUser;
    }

    public void setPhoneUser(String phoneUser) {
        this.phoneUser = phoneUser;
    }

    public byte[] getPhotoUser() {
        return photoUser;
    }

    public void setPhotoUser(byte[] photoUser) {
        this.photoUser = photoUser;
    }

    public String getCareerUser() {
        return careerUser;
    }

    public void setCareerUser(String careerUser) {
        this.careerUser = careerUser;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserEntity that = (UserEntity) o;
        return idUser == that.idUser && idUni == that.idUni && Objects.equals(emailUser, that.emailUser) && Objects.equals(nameUser, that.nameUser) && Objects.equals(lastnameUser, that.lastnameUser) && Objects.equals(passUser, that.passUser) && Objects.equals(phoneUser, that.phoneUser) && Arrays.equals(photoUser, that.photoUser) && Objects.equals(careerUser, that.careerUser);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(idUser, idUni, emailUser, nameUser, lastnameUser, passUser, phoneUser, careerUser);
        result = 31 * result + Arrays.hashCode(photoUser);
        return result;
    }
}
