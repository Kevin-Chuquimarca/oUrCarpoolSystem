package ec.edu.espe.TripsService.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;
import java.util.Objects;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "driver", schema = "trip_service_db")
public class DriverEntity {
    @Id
    @Column(name = "id_dri", nullable = false)
    private int idDri;
    @Basic
    @Column(name = "id_loc", nullable = true)
    private Long idLoc;
    @Basic
    @Column(name = "plate_car_dri", nullable = true, length = 7)
    private String plateCarDri;
    @Basic
    @Column(name = "photo_car_dri", nullable = true, length = 30)
    private String photoCarDri;
    @Basic
    @Column(name = "cod_user_dri", nullable = true)
    private Integer codUserDri;
    @ManyToOne
    @JoinColumn(name = "id_loc", referencedColumnName = "id_loc", insertable = false, updatable = false)
    private LocationEntity locationByIdLoc;
    @OneToMany(mappedBy = "driverByIdDri")
    private Collection<RequestEntity> requestsByIdDri;
    @OneToMany(mappedBy = "driverByIdDri")
    private Collection<TripEntity> tripsByIdDri;
}
