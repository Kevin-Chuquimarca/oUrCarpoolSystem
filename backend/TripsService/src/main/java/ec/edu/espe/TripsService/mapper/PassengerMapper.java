package ec.edu.espe.TripsService.mapper;

import ec.edu.espe.TripsService.dto.PassengerDTO;
import ec.edu.espe.TripsService.entity.PassengerEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface PassengerMapper {
    PassengerMapper INSTANCE = Mappers.getMapper(PassengerMapper.class);

    @Mapping(source = "idPas", target = "id")
    @Mapping(source = "idTrip", target = "idTrip")
    @Mapping(source = "idLoc", target = "idLoc")
    @Mapping(source = "codUserPas", target = "codUser")
    PassengerDTO toPassengerDTO(PassengerEntity passengerEntity);

    @Mapping(source = "id", target = "idPas")
    @Mapping(source = "idTrip", target = "idTrip")
    @Mapping(source = "idLoc", target = "idLoc")
    @Mapping(source = "codUser", target = "codUserPas")
    PassengerEntity toPassengerEntity(PassengerDTO passengerDTO);
}