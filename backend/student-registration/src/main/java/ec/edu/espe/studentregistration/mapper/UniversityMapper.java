package ec.edu.espe.studentregistration.mapper;

import ec.edu.espe.studentregistration.dto.UniversityDTO;
import ec.edu.espe.studentregistration.entity.UniversityEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UniversityMapper {
    UniversityMapper INSTANCE = Mappers.getMapper(UniversityMapper.class);

    @Mapping(source = "idUni", target = "id")
    @Mapping(source = "nameUni", target = "name")
    @Mapping(source = "emailDomainUni", target = "emailDomain")
    UniversityDTO toUniversityDTO(UniversityEntity universityEntity);

    @Mapping(source = "id", target = "idUni")
    @Mapping(source = "name", target = "nameUni")
    @Mapping(source = "emailDomain", target = "emailDomainUni")
    UniversityEntity toUniversityEntity(UniversityDTO universityDTO);
}
