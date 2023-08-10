package ec.edu.espe.TripsService.mapper;

import ec.edu.espe.TripsService.dto.LocationDTO;
import ec.edu.espe.TripsService.entity.LocationEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface LocationMapper {
    LocationMapper INSTANCE = Mappers.getMapper(LocationMapper.class);

    @Mapping(source = "idLoc", target = "id")
    @Mapping(source = "latLoc", target = "lat")
    @Mapping(source = "longLoc", target = "lng")
    @Mapping(source = "nameLoc", target = "name")
    LocationDTO toLocationDTO(LocationEntity locationEntity);

    @Mapping(source = "id", target = "idLoc")
    @Mapping(source = "lat", target = "latLoc")
    @Mapping(source = "lng", target = "longLoc")
    @Mapping(source = "name", target = "nameLoc")
    LocationEntity toLocationEntity(LocationDTO locationDTO);
}
