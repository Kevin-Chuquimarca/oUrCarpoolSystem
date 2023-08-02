package ec.edu.espe.TripsService.mapper;

import ec.edu.espe.TripsService.dto.DriverDTO;
import ec.edu.espe.TripsService.entity.DriverEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface DriverMapper {
    DriverMapper INSTANCE = Mappers.getMapper(DriverMapper.class);

    @Mapping(source = "idDri", target = "id")
    @Mapping(source = "plateCarDri", target = "plateCar")
    @Mapping(source = "modelCarDri", target = "modelCar")
    @Mapping(source = "photoCarDri", target = "photoCar")
    @Mapping(source = "numSeatsDri", target = "numSeats")
    @Mapping(source = "freeSeatsDri", target = "freeSeats")
    @Mapping(source = "codUserDri", target = "codUser")
    DriverDTO toDriverDTO(DriverEntity driverEntity);

    @Mapping(source = "id", target = "idDri")
    @Mapping(source = "plateCar", target = "plateCarDri")
    @Mapping(source = "modelCar", target = "modelCarDri")
    @Mapping(source = "photoCar", target = "photoCarDri")
    @Mapping(source = "numSeats", target = "numSeatsDri")
    @Mapping(source = "freeSeats", target = "freeSeatsDri")
    @Mapping(source = "codUser", target = "codUserDri")
    DriverEntity toDriverEntity(DriverDTO driverDTO);

}
