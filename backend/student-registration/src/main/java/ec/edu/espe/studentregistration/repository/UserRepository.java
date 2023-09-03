package ec.edu.espe.studentregistration.repository;

import ec.edu.espe.studentregistration.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
    Optional<UserEntity> findByEmail(String emailUser);
    Optional<UserEntity> findByCI(String ciUser);
}
