package ec.edu.espe.TripsService.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "location", schema = "trip_service_db")
public class LocationEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_loc", nullable = false)
    private long idLoc;
    @Basic
    @Column(name = "lat_loc", nullable = true, precision = 9, scale = 6)
    private BigDecimal latLoc;
    @Basic
    @Column(name = "long_loc", nullable = true, precision = 9, scale = 6)
    private BigDecimal longLoc;
    @Basic
    @Column(name = "name_loc", nullable = true, length = 30)
    private String nameLoc;
    @OneToMany(mappedBy = "locationByIdLoc")
    private Collection<DriverEntity> driversByIdLoc;
    @OneToMany(mappedBy = "locationByIdLoc")
    private Collection<PassengerEntity> passengersByIdLoc;
    @OneToMany(mappedBy = "locationByIdLoc")
    private Collection<TripEntity> tripsByIdLoc;
}
