package ec.edu.espe.studentregistration.repository;

import ec.edu.espe.studentregistration.entity.UniversityEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UniversityRepository extends JpaRepository<UniversityEntity, Integer> {
}
