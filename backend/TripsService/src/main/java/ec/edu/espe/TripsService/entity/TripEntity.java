package ec.edu.espe.TripsService.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Time;
import java.util.Collection;
import java.util.Objects;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "trip", schema = "trip_service_db")
@NamedQueries({
        @NamedQuery(name = "TripEntity.findAllByAvailableTrip", query = "SELECT t FROM TripEntity t WHERE t.availableTrip = 1"),
})
public class TripEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_trip", nullable = false)
    private long idTrip;
    @Basic
    @Column(name = "id_dri", nullable = false)
    private int idDri;
    @Basic
    @Column(name = "id_loc", nullable = true)
    private Long idLoc;
    @Basic
    @Column(name = "leave_hour_trip", nullable = true)
    private Time leaveHourTrip;
    @Basic
    @Column(name = "date_trip", nullable = true)
    private Date dateTrip;
    @Basic
    @Column(name = "available_trip", nullable = true)
    private Byte availableTrip;
    @Basic
    @Column(name = "free_seats_trip", nullable = true)
    private Integer freeSeatsTrip;
    @Basic
    @Column(name = "type_trip_trip", nullable = true, length = 1)
    private String typeTripTrip;
    @OneToMany(mappedBy = "tripByIdTrip")
    private Collection<PassengerEntity> passengersByIdTrip;
    @ManyToOne
    @JoinColumn(name = "id_dri", referencedColumnName = "id_dri", nullable = false, insertable = false, updatable = false)
    private DriverEntity driverByIdDri;
    @ManyToOne
    @JoinColumn(name = "id_loc", referencedColumnName = "id_loc", insertable = false, updatable = false)
    private LocationEntity locationByIdLoc;
}
