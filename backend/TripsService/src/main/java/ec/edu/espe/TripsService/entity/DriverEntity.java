package ec.edu.espe.TripsService.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Entity
@Table(name = "driver", schema = "trip_service_db")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DriverEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_dri", nullable = false)
    private int idDri;
    @Basic
    @Column(name = "plate_car_dri", nullable = true, length = 6)
    private String plateCarDri;
    @Basic
    @Column(name = "model_car_dri", nullable = true, length = 20)
    private String modelCarDri;
    @Basic
    @Column(name = "photo_car_dri", nullable = true, length = 30)
    private String photoCarDri;
    @Basic
    @Column(name = "num_seats_dri", nullable = true)
    private Integer numSeatsDri;
    @Basic
    @Column(name = "free_seats_dri", nullable = true)
    private Integer freeSeatsDri;
    @Basic
    @Column(name = "cod_user_dri", nullable = true)
    private Integer codUserDri;
    @OneToMany(mappedBy = "driverByIdDri")
    private Collection<LocationEntity> locationsByIdDri;
    @OneToMany(mappedBy = "driverByIdDri")
    private Collection<RequestEntity> requestsByIdDri;
    @OneToMany(mappedBy = "driverByIdDri")
    private Collection<TripEntity> tripsByIdDri;
}
