package ec.edu.espe.tripsservice.mapper;

import ec.edu.espe.tripsservice.dto.RequestDTO;
import ec.edu.espe.tripsservice.entity.RequestEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface RequestMapper {
    RequestMapper INSTANCE = Mappers.getMapper(RequestMapper.class);

    @Mapping(source = "idReq", target = "id")
    @Mapping(source = "idDri", target = "idDri")
    @Mapping(source = "idPas", target = "idPas")
    @Mapping(source = "nameUReq", target = "nameU")
    @Mapping(source = "lastNameUReq", target = "lastNameU")
    @Mapping(source = "phoneUReq", target = "phoneU")
    @Mapping(source = "dateReq", target = "date")
    @Mapping(source = "stateReq", target = "state")
    RequestDTO toRequestDTO(RequestEntity requestEntity);

    @Mapping(source = "id", target = "idReq")
    @Mapping(source = "idDri", target = "idDri")
    @Mapping(source = "idPas", target = "idPas")
    @Mapping(source = "nameU", target = "nameUReq")
    @Mapping(source = "lastNameU", target = "lastNameUReq")
    @Mapping(source = "phoneU", target = "phoneUReq")
    @Mapping(source = "date", target = "dateReq")
    @Mapping(source = "state", target = "stateReq")
    RequestEntity toRequestEntity(RequestDTO requestDTO);
}
