package ec.edu.espe.StudentRegistration.repository;

import ec.edu.espe.StudentRegistration.entity.OptionRoleEntity;
import ec.edu.espe.StudentRegistration.entity.RoleOptionEntity;
import ec.edu.espe.StudentRegistration.entity.RoleOptionEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleOptionRepository extends JpaRepository<RoleOptionEntity, RoleOptionEntityPK> {
    List<OptionRoleEntity> findOptionByIdRl(String idRl);
}
