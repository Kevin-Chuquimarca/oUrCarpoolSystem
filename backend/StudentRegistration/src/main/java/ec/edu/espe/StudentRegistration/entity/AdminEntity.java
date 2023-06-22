package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "ADMIN", schema = "our_carpool_db", catalog = "")
public class AdminEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "PIN_ADMIN")
    private int pinAdmin;
    @Basic
    @Column(name = "USER_ADMIN")
    private String userAdmin;
    @Basic
    @Column(name = "PASSWORD_ADMIN")
    private String passwordAdmin;
    @Basic
    @Column(name = "EMAIL_ADMIN")
    private String emailAdmin;
    @Basic
    @Column(name = "PHONE_ADMIN")
    private String phoneAdmin;

    public int getPinAdmin() {
        return pinAdmin;
    }

    public void setPinAdmin(int pinAdmin) {
        this.pinAdmin = pinAdmin;
    }

    public String getUserAdmin() {
        return userAdmin;
    }

    public void setUserAdmin(String userAdmin) {
        this.userAdmin = userAdmin;
    }

    public String getPasswordAdmin() {
        return passwordAdmin;
    }

    public void setPasswordAdmin(String passwordAdmin) {
        this.passwordAdmin = passwordAdmin;
    }

    public String getEmailAdmin() {
        return emailAdmin;
    }

    public void setEmailAdmin(String emailAdmin) {
        this.emailAdmin = emailAdmin;
    }

    public String getPhoneAdmin() {
        return phoneAdmin;
    }

    public void setPhoneAdmin(String phoneAdmin) {
        this.phoneAdmin = phoneAdmin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdminEntity that = (AdminEntity) o;
        return pinAdmin == that.pinAdmin && Objects.equals(userAdmin, that.userAdmin) && Objects.equals(passwordAdmin, that.passwordAdmin) && Objects.equals(emailAdmin, that.emailAdmin) && Objects.equals(phoneAdmin, that.phoneAdmin);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pinAdmin, userAdmin, passwordAdmin, emailAdmin, phoneAdmin);
    }
}
