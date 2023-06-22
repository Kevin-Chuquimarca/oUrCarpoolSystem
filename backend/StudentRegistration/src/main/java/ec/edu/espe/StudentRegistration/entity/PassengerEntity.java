package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "PASSENGER", schema = "our_carpool_db", catalog = "")
public class PassengerEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID_PASSENGER")
    private int idPassenger;
    @Basic
    @Column(name = "ID_USER")
    private int idUser;

    public int getIdPassenger() {
        return idPassenger;
    }

    public void setIdPassenger(int idPassenger) {
        this.idPassenger = idPassenger;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PassengerEntity that = (PassengerEntity) o;
        return idPassenger == that.idPassenger && idUser == that.idUser;
    }

    @Override
    public int hashCode() {
        return Objects.hash(idPassenger, idUser);
    }
}
