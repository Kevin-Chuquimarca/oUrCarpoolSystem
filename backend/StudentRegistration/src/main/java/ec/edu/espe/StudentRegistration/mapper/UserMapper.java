package ec.edu.espe.StudentRegistration.mapper;

import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.entity.UserEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserMapper {
    UserMapper INSTANCE = Mappers.getMapper(UserMapper.class);

    @Mapping(source = "idUser", target = "id")
    @Mapping(source = "idUni", target = "idUni")
    @Mapping(source = "idRl", target = "idRl")
    @Mapping(source = "ciUser", target = "ci")
    @Mapping(source = "emailUser", target = "email")
    @Mapping(source = "nameUser", target = "name")
    @Mapping(source = "lastNameUser", target = "lastName")
    @Mapping(source = "phoneUser", target = "phone")
    @Mapping(source = "photoUser", target = "photo")
    @Mapping(source = "careerUser", target = "career")
    @Mapping(source = "firstLoginUser", target = "firstLogin")
    UserDTO toUserDTO(UserEntity userEntity);

    @Mapping(source = "id", target = "idUser")
    @Mapping(source = "idUni", target = "idUni")
    @Mapping(source = "idRl", target = "idRl")
    @Mapping(source = "ci", target = "ciUser")
    @Mapping(source = "email", target = "emailUser")
    @Mapping(source = "name", target = "nameUser")
    @Mapping(source = "lastName", target = "lastNameUser")
    @Mapping(source = "phone", target = "phoneUser")
    @Mapping(source = "photo", target = "photoUser")
    @Mapping(source = "career", target = "careerUser")
    @Mapping(source = "firstLogin", target = "firstLoginUser")
    UserEntity toUserEntity(UserDTO userDTO);

}
