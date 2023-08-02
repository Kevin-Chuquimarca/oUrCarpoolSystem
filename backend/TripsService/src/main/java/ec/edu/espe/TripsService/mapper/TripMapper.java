package ec.edu.espe.TripsService.mapper;

import ec.edu.espe.TripsService.dto.TripDTO;
import ec.edu.espe.TripsService.entity.TripEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface TripMapper {
    TripMapper INSTANCE = Mappers.getMapper(TripMapper.class);

    @Mapping(source = "id", target = "idTrip")
    @Mapping(source = "idDri", target = "idDri")
    @Mapping(source = "leaveHour", target = "leaveHourTrip")
    @Mapping(source = "date", target = "dateTrip")
    @Mapping(source = "arrivalHour", target = "arrivalHourTrip")
    @Mapping(source = "available", target = "availableTrip")
    @Mapping(source = "priceAll", target = "priceAllTrip")
    TripEntity toTripEntity(TripDTO tripDTO);

    @Mapping(source = "idTrip", target = "id")
    @Mapping(source = "idDri", target = "idDri")
    @Mapping(source = "leaveHourTrip", target = "leaveHour")
    @Mapping(source = "dateTrip", target = "date")
    @Mapping(source = "arrivalHourTrip", target = "arrivalHour")
    @Mapping(source = "availableTrip", target = "available")
    @Mapping(source = "priceAllTrip", target = "priceAll")
    TripDTO toTripDTO(TripEntity tripEntity);
}
