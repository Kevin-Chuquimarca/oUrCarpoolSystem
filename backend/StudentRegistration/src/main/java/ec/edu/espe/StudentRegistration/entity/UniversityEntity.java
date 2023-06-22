package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "UNIVERSITY", schema = "our_carpool_db", catalog = "")
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

    public int getIdUni() {
        return idUni;
    }

    public void setIdUni(int idUni) {
        this.idUni = idUni;
    }

    public String getNameUni() {
        return nameUni;
    }

    public void setNameUni(String nameUni) {
        this.nameUni = nameUni;
    }

    public String getEmailDomainUni() {
        return emailDomainUni;
    }

    public void setEmailDomainUni(String emailDomainUni) {
        this.emailDomainUni = emailDomainUni;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UniversityEntity that = (UniversityEntity) o;
        return idUni == that.idUni && Objects.equals(nameUni, that.nameUni) && Objects.equals(emailDomainUni, that.emailDomainUni);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idUni, nameUni, emailDomainUni);
    }
}
