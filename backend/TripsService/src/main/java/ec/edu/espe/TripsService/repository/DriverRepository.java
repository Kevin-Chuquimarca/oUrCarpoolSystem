package ec.edu.espe.TripsService.repository;

import ec.edu.espe.TripsService.entity.DriverEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DriverRepository extends JpaRepository<DriverEntity, Integer> {
}
