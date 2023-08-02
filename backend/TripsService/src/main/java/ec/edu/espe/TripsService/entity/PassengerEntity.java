package ec.edu.espe.TripsService.entity;

import jakarta.persistence.*;

import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "passenger", schema = "trip_service_db", catalog = "")
public class PassengerEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_pas", nullable = false)
    private int idPas;
    @Basic
    @Column(name = "id_trip", nullable = false)
    private long idTrip;
    @Basic
    @Column(name = "cod_user_pas", nullable = true)
    private Integer codUserPas;
    @OneToMany(mappedBy = "passengerByIdPas")
    private Collection<LocationEntity> locationsByIdPas;
    @ManyToOne
    @JoinColumn(name = "id_trip", referencedColumnName = "id_trip", nullable = false, insertable = false, updatable = false)
    private TripEntity tripByIdTrip;
    @OneToMany(mappedBy = "passengerByIdPas")
    private Collection<RequestEntity> requestsByIdPas;

    public int getIdPas() {
        return idPas;
    }

    public void setIdPas(int idPas) {
        this.idPas = idPas;
    }

    public long getIdTrip() {
        return idTrip;
    }

    public void setIdTrip(long idTrip) {
        this.idTrip = idTrip;
    }

    public Integer getCodUserPas() {
        return codUserPas;
    }

    public void setCodUserPas(Integer codUserPas) {
        this.codUserPas = codUserPas;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PassengerEntity that = (PassengerEntity) o;
        return idPas == that.idPas && idTrip == that.idTrip && Objects.equals(codUserPas, that.codUserPas);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idPas, idTrip, codUserPas);
    }

    public Collection<LocationEntity> getLocationsByIdPas() {
        return locationsByIdPas;
    }

    public void setLocationsByIdPas(Collection<LocationEntity> locationsByIdPas) {
        this.locationsByIdPas = locationsByIdPas;
    }

    public TripEntity getTripByIdTrip() {
        return tripByIdTrip;
    }

    public void setTripByIdTrip(TripEntity tripByIdTrip) {
        this.tripByIdTrip = tripByIdTrip;
    }

    public Collection<RequestEntity> getRequestsByIdPas() {
        return requestsByIdPas;
    }

    public void setRequestsByIdPas(Collection<RequestEntity> requestsByIdPas) {
        this.requestsByIdPas = requestsByIdPas;
    }
}
