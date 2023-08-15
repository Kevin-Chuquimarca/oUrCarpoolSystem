package ec.edu.espe.TripsService.repository;

import ec.edu.espe.TripsService.entity.LocationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LocationRepository extends JpaRepository<LocationEntity, Long> {
    List<LocationEntity> findAllByIdLocAndIdTrip(Long idTrip);
}
