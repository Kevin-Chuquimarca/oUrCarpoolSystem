package ec.edu.espe.tripsservice.repository;

import ec.edu.espe.tripsservice.entity.RequestEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RequestRepository extends JpaRepository<RequestEntity, Long> {
    List<RequestEntity> findAllByIdDri (Long idDri);
}
