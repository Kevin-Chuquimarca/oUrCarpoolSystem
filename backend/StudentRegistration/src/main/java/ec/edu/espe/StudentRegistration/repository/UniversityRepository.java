package ec.edu.espe.StudentRegistration.repository;

import ec.edu.espe.StudentRegistration.entity.UniversityEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UniversityRepository extends JpaRepository<UniversityEntity, Integer> {
}
