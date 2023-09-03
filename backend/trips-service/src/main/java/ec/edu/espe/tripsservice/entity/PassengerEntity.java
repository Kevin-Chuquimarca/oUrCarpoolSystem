package ec.edu.espe.tripsservice.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "passenger", schema = "trips_service_db")
@NamedQueries({
        @NamedQuery(name = "PassengerEntity.findAllByIdTrip", query = "SELECT p FROM PassengerEntity p WHERE p.idTrip = :idTrip"),
})
public class PassengerEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_pas", nullable = false)
    private int idPas;
    @Basic
    @Column(name = "id_trip", nullable = true)
    private Long idTrip;
    @Basic
    @Column(name = "id_loc", nullable = true)
    private Long idLoc;
    @Basic
    @Column(name = "cod_user_pas", nullable = true)
    private Integer codUserPas;
    @ManyToOne
    @JoinColumn(name = "id_trip", referencedColumnName = "id_trip", insertable = false, updatable = false)
    private TripEntity tripByIdTrip;
    @ManyToOne
    @JoinColumn(name = "id_loc", referencedColumnName = "id_loc", insertable = false, updatable = false)
    private LocationEntity locationByIdLoc;
    @OneToMany(mappedBy = "passengerByIdPas")
    private Collection<RequestEntity> requestsByIdPas;
}
