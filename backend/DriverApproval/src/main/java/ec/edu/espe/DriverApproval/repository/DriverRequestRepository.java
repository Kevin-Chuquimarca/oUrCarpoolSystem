package ec.edu.espe.DriverApproval.repository;

import ec.edu.espe.DriverApproval.entity.DriverRequestEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DriverRequestRepository extends JpaRepository<DriverRequestEntity, Integer> {
    List<DriverRequestEntity> findByStateDr(String stateDr);
}
