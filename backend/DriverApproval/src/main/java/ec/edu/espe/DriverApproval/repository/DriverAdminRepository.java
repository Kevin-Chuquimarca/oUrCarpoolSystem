package ec.edu.espe.DriverApproval.repository;

import ec.edu.espe.DriverApproval.entity.DriverAdminEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DriverAdminRepository extends JpaRepository<DriverAdminEntity, Integer> {

}
