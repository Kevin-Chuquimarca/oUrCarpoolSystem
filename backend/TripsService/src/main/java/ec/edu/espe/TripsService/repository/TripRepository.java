package ec.edu.espe.TripsService.repository;

import ec.edu.espe.TripsService.entity.TripEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TripRepository extends JpaRepository<TripEntity, Long> {

    List<TripEntity> findAllByAvailableTrip();
}
