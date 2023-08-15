package ec.edu.espe.TripsService.repository;

import ec.edu.espe.TripsService.entity.PassengerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PassengerRepository extends JpaRepository<PassengerEntity, Integer> {
    List<PassengerEntity> findAllByIdTrip(long idTrip);
}
