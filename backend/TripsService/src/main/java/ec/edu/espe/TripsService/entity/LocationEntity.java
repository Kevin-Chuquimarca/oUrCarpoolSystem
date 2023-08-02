package ec.edu.espe.TripsService.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "location", schema = "trip_service_db", catalog = "")
public class LocationEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_loc", nullable = false)
    private long idLoc;
    @Basic
    @Column(name = "id_pas", nullable = false)
    private int idPas;
    @Basic
    @Column(name = "id_dri", nullable = false)
    private int idDri;
    @Basic
    @Column(name = "id_trip", nullable = false)
    private long idTrip;
    @Basic
    @Column(name = "lat_loc", nullable = true, precision = 6)
    private BigDecimal latLoc;
    @Basic
    @Column(name = "long_loc", nullable = true, precision = 6)
    private BigDecimal longLoc;
    @Basic
    @Column(name = "name_loc", nullable = true, length = 30)
    private String nameLoc;
    @ManyToOne
    @JoinColumn(name = "id_pas", referencedColumnName = "id_pas", nullable = false, insertable = false, updatable = false)
    private PassengerEntity passengerByIdPas;
    @ManyToOne
    @JoinColumn(name = "id_dri", referencedColumnName = "id_dri", nullable = false, insertable = false, updatable = false)
    private DriverEntity driverByIdDri;
    @ManyToOne
    @JoinColumn(name = "id_trip", referencedColumnName = "id_trip", nullable = false, insertable = false, updatable = false)
    private TripEntity tripByIdTrip;

    public long getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(long idLoc) {
        this.idLoc = idLoc;
    }

    public int getIdPas() {
        return idPas;
    }

    public void setIdPas(int idPas) {
        this.idPas = idPas;
    }

    public int getIdDri() {
        return idDri;
    }

    public void setIdDri(int idDri) {
        this.idDri = idDri;
    }

    public long getIdTrip() {
        return idTrip;
    }

    public void setIdTrip(long idTrip) {
        this.idTrip = idTrip;
    }

    public BigDecimal getLatLoc() {
        return latLoc;
    }

    public void setLatLoc(BigDecimal latLoc) {
        this.latLoc = latLoc;
    }

    public BigDecimal getLongLoc() {
        return longLoc;
    }

    public void setLongLoc(BigDecimal longLoc) {
        this.longLoc = longLoc;
    }

    public String getNameLoc() {
        return nameLoc;
    }

    public void setNameLoc(String nameLoc) {
        this.nameLoc = nameLoc;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LocationEntity that = (LocationEntity) o;
        return idLoc == that.idLoc && idPas == that.idPas && idDri == that.idDri && idTrip == that.idTrip && Objects.equals(latLoc, that.latLoc) && Objects.equals(longLoc, that.longLoc) && Objects.equals(nameLoc, that.nameLoc);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idLoc, idPas, idDri, idTrip, latLoc, longLoc, nameLoc);
    }

    public PassengerEntity getPassengerByIdPas() {
        return passengerByIdPas;
    }

    public void setPassengerByIdPas(PassengerEntity passengerByIdPas) {
        this.passengerByIdPas = passengerByIdPas;
    }

    public DriverEntity getDriverByIdDri() {
        return driverByIdDri;
    }

    public void setDriverByIdDri(DriverEntity driverByIdDri) {
        this.driverByIdDri = driverByIdDri;
    }

    public TripEntity getTripByIdTrip() {
        return tripByIdTrip;
    }

    public void setTripByIdTrip(TripEntity tripByIdTrip) {
        this.tripByIdTrip = tripByIdTrip;
    }
}
