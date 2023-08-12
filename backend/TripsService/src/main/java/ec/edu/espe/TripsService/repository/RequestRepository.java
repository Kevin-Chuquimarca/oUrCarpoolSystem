package ec.edu.espe.TripsService.repository;

import ec.edu.espe.TripsService.entity.RequestEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RequestRepository extends JpaRepository<RequestEntity, Long> {
    List<RequestEntity> findAllByIdDri (Long idDri);
}
