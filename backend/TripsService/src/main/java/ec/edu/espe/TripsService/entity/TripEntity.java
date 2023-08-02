package ec.edu.espe.TripsService.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;
import java.util.Collection;

@Entity
@Table(name = "trip", schema = "trip_service_db")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TripEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_trip", nullable = false)
    private long idTrip;
    @Basic
    @Column(name = "id_dri", nullable = false)
    private int idDri;
    @Basic
    @Column(name = "leave_hour_trip", nullable = true)
    private Time leaveHourTrip;
    @Basic
    @Column(name = "date_trip", nullable = true)
    private Date dateTrip;
    @Basic
    @Column(name = "arrival_hour_trip", nullable = true)
    private Time arrivalHourTrip;
    @Basic
    @Column(name = "available_trip", nullable = true)
    private Byte availableTrip;
    @Basic
    @Column(name = "price_all_trip", nullable = true, precision = 2)
    private BigDecimal priceAllTrip;
    @OneToMany(mappedBy = "tripByIdTrip")
    private Collection<LocationEntity> locationsByIdTrip;
    @OneToMany(mappedBy = "tripByIdTrip")
    private Collection<PassengerEntity> passengersByIdTrip;
    @ManyToOne
    @JoinColumn(name = "id_dri", referencedColumnName = "id_dri", nullable = false, insertable = false, updatable = false)
    private DriverEntity driverByIdDri;
}
