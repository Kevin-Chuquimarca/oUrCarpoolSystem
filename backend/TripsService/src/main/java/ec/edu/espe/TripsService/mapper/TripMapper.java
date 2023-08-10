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
    @Mapping(source = "idLoc", target = "idLoc")
    @Mapping(source = "leaveHour", target = "leaveHourTrip")
    @Mapping(source = "date", target = "dateTrip")
    @Mapping(source = "available", target = "availableTrip")
    @Mapping(source = "freeSeats", target = "freeSeatsTrip")
    @Mapping(source = "typeTrip", target = "typeTripTrip")
    TripEntity toTripEntity(TripDTO tripDTO);

    @Mapping(source = "idTrip", target = "id")
    @Mapping(source = "idDri", target = "idDri")
    @Mapping(source = "idLoc", target = "idLoc")
    @Mapping(source = "leaveHourTrip", target = "leaveHour")
    @Mapping(source = "dateTrip", target = "date")
    @Mapping(source = "availableTrip", target = "available")
    @Mapping(source = "freeSeatsTrip", target = "freeSeats")
    @Mapping(source = "typeTripTrip", target = "typeTrip")
    TripDTO toTripDTO(TripEntity tripEntity);
}
