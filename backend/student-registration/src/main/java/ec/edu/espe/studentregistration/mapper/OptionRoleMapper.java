package ec.edu.espe.studentregistration.mapper;

import ec.edu.espe.studentregistration.dto.OptionRoleDTO;
import ec.edu.espe.studentregistration.entity.OptionRoleEntity;
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
