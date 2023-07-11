package ec.edu.espe.StudentRegistration.mapper;

import ec.edu.espe.StudentRegistration.dto.OptionRoleDTO;
import ec.edu.espe.StudentRegistration.entity.OptionRoleEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface OptionRoleMapper {
    OptionRoleMapper INSTANCE = Mappers.getMapper(OptionRoleMapper.class);

    @Mapping(source = "idOp", target = "id")
    @Mapping(source = "nameOp", target = "name")
    OptionRoleDTO toOptionRoleDTO(OptionRoleEntity optionRoleEntity);

    @Mapping(source = "id", target = "idOp")
    @Mapping(source = "name", target = "nameOp")
    OptionRoleEntity toOptionRoleEntity(OptionRoleDTO optionRoleDTO);
}
