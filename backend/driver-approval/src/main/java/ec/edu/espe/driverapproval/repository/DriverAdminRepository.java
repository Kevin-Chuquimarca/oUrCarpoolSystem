package ec.edu.espe.driverapproval.repository;

import ec.edu.espe.driverapproval.entity.DriverAdminEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DriverAdminRepository extends JpaRepository<DriverAdminEntity, Integer> {

}
