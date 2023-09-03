package ec.edu.espe.tripsservice.repository;

import ec.edu.espe.tripsservice.entity.LocationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LocationRepository extends JpaRepository<LocationEntity, Long> {
    List<LocationEntity> findAllByIdLocAndIdTrip(Long idTrip);
}
