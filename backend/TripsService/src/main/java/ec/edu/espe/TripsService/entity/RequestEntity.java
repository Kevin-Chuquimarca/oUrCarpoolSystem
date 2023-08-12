package ec.edu.espe.TripsService.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Objects;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "request", schema = "trip_service_db")
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
    @Column(name="name_u_req", nullable = true, length = 20)
    private String nameUReq;
    @Basic
    @Column(name="last_name_u_req", nullable = true, length = 20)
    private String lastNameUReq;
    @Basic
    @Column(name = "phone_u_req", nullable = true, length = 10)
    private String phoneUReq;
    @Basic
    @Column(name="date_req", nullable = true)
    private Date dateReq;
    @Basic
    @Column(name = "state_req", nullable = true, length = 1)
    private String stateReq;
    @ManyToOne
    @JoinColumn(name = "id_dri", referencedColumnName = "id_dri", nullable = false, insertable = false, updatable = false)
    private DriverEntity driverByIdDri;
    @ManyToOne
    @JoinColumn(name = "id_pas", referencedColumnName = "id_pas", nullable = false, insertable = false, updatable = false)
    private PassengerEntity passengerByIdPas;
}
