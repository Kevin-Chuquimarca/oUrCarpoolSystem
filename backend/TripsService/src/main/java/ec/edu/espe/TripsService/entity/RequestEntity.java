package ec.edu.espe.TripsService.entity;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "request", schema = "trip_service_db", catalog = "")
public class RequestEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_req", nullable = false)
    private long idReq;
    @Basic
    @Column(name = "id_dri", nullable = false)
    private int idDri;
    @Basic
    @Column(name = "id_pas", nullable = false)
    private int idPas;
    @Basic
    @Column(name = "phone_req", nullable = true, length = 10)
    private String phoneReq;
    @Basic
    @Column(name = "state_req", nullable = true, length = 1)
    private String stateReq;
    @ManyToOne
    @JoinColumn(name = "id_dri", referencedColumnName = "id_dri", nullable = false, insertable = false, updatable = false)
    private DriverEntity driverByIdDri;
    @ManyToOne
    @JoinColumn(name = "id_pas", referencedColumnName = "id_pas", nullable = false, insertable = false, updatable = false)
    private PassengerEntity passengerByIdPas;

    public long getIdReq() {
        return idReq;
    }

    public void setIdReq(long idReq) {
        this.idReq = idReq;
    }

    public int getIdDri() {
        return idDri;
    }

    public void setIdDri(int idDri) {
        this.idDri = idDri;
    }

    public int getIdPas() {
        return idPas;
    }

    public void setIdPas(int idPas) {
        this.idPas = idPas;
    }

    public String getPhoneReq() {
        return phoneReq;
    }

    public void setPhoneReq(String phoneReq) {
        this.phoneReq = phoneReq;
    }

    public String getStateReq() {
        return stateReq;
    }

    public void setStateReq(String stateReq) {
        this.stateReq = stateReq;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RequestEntity that = (RequestEntity) o;
        return idReq == that.idReq && idDri == that.idDri && idPas == that.idPas && Objects.equals(phoneReq, that.phoneReq) && Objects.equals(stateReq, that.stateReq);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idReq, idDri, idPas, phoneReq, stateReq);
    }

    public DriverEntity getDriverByIdDri() {
        return driverByIdDri;
    }

    public void setDriverByIdDri(DriverEntity driverByIdDri) {
        this.driverByIdDri = driverByIdDri;
    }

    public PassengerEntity getPassengerByIdPas() {
        return passengerByIdPas;
    }

    public void setPassengerByIdPas(PassengerEntity passengerByIdPas) {
        this.passengerByIdPas = passengerByIdPas;
    }
}
