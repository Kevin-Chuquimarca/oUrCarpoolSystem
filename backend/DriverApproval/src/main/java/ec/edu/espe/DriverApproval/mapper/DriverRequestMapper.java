package ec.edu.espe.DriverApproval.mapper;

import ec.edu.espe.DriverApproval.dto.DriverRequestDTO;
import ec.edu.espe.DriverApproval.entity.DriverRequestEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface DriverRequestMapper {
    DriverRequestMapper INSTANCE = Mappers.getMapper(DriverRequestMapper.class);

    @Mapping(source = "id", target = "idDr")
    @Mapping(source = "idAd", target = "idAd")
    @Mapping(source = "email", target = "emailDr")
    @Mapping(source = "shippingDate", target = "shippingDateDr")
    @Mapping(source = "approvalDate", target = "approvalDateDr")
    @Mapping(source = "typeLic", target = "typeLicDr")
    @Mapping(source = "expiryDateLic", target = "expiryDateLicDr")
    @Mapping(source = "photoLic", target = "photoLicDr")
    @Mapping(source = "plateCar", target = "plateCarDr")
    @Mapping(source = "photoCar", target = "photoCarDr")
    @Mapping(source = "state", target = "stateDr")
    @Mapping(source = "message", target = "messageDr")
    @Mapping(source = "codUser", target = "codUserDr")
    DriverRequestEntity toDriverRequestEntity(DriverRequestDTO driverRequestDTO);

    @Mapping(source = "idDr", target = "id")
    @Mapping(source = "idAd", target = "idAd")
    @Mapping(source = "emailDr", target = "email")
    @Mapping(source = "shippingDateDr", target = "shippingDate")
    @Mapping(source = "approvalDateDr", target = "approvalDate")
    @Mapping(source = "typeLicDr", target = "typeLic")
    @Mapping(source = "expiryDateLicDr", target = "expiryDateLic")
    @Mapping(source = "photoLicDr", target = "photoLic")
    @Mapping(source = "plateCarDr", target = "plateCar")
    @Mapping(source = "photoCarDr", target = "photoCar")
    @Mapping(source = "stateDr", target = "state")
    @Mapping(source = "messageDr", target = "message")
    @Mapping(source = "codUserDr", target = "codUser")
    DriverRequestDTO toDriverRequestDTO(DriverRequestEntity driverRequestEntity);
}
