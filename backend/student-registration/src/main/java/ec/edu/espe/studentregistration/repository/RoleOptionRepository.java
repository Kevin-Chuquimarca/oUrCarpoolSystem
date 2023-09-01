package ec.edu.espe.studentregistration.repository;

import ec.edu.espe.studentregistration.entity.OptionRoleEntity;
import ec.edu.espe.studentregistration.entity.RoleOptionEntity;
import ec.edu.espe.studentregistration.entity.RoleOptionEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleOptionRepository extends JpaRepository<RoleOptionEntity, RoleOptionEntityPK> {
    List<OptionRoleEntity> findOptionByIdRl(String idRl);
}
