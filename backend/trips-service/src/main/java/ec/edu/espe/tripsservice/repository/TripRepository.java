package ec.edu.espe.tripsservice.repository;

import ec.edu.espe.tripsservice.entity.TripEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TripRepository extends JpaRepository<TripEntity, Long> {

    List<TripEntity> findAllByAvailableTrip();

    Optional<TripEntity> findByIdDriAndAvailableTrip(int idDri);
}
