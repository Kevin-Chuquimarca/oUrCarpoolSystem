package ec.edu.espe.StudentRegistration.repository;

import ec.edu.espe.StudentRegistration.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
}
