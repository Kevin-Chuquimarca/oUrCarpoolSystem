package ec.edu.espe.driverapproval.mapper;

import ec.edu.espe.driverapproval.dto.DriverAdminDTO;
import ec.edu.espe.driverapproval.entity.DriverAdminEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;


@Mapper
public interface DriverAdminMapper {
    DriverAdminMapper INSTANCE = Mappers.getMapper(DriverAdminMapper.class);

    @Mapping(source = "idAd", target = "id")
    @Mapping(source = "nameAd", target = "name")
    @Mapping(source = "lastNameAd", target = "lastName")
    @Mapping(source = "emailAd", target = "email")
    @Mapping(source = "phoneAd", target = "phone")
    DriverAdminDTO toDriverAdminDTO(DriverAdminEntity driverAdminEntity);

    @Mapping(source = "id", target = "idAd")
    @Mapping(source = "name", target = "nameAd")
    @Mapping(source = "lastName", target = "lastNameAd")
    @Mapping(source = "email", target = "emailAd")
    @Mapping(source = "phone", target = "phoneAd")
    DriverAdminEntity toDriverAdminEntity(DriverAdminDTO adminDTO);
}
