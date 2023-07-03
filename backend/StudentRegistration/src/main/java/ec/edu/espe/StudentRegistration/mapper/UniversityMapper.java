package ec.edu.espe.StudentRegistration.mapper;

import ec.edu.espe.StudentRegistration.dto.UniversityDTO;
import ec.edu.espe.StudentRegistration.entity.UniversityEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UniversityMapper {
    UniversityMapper INSTANCE = Mappers.getMapper(UniversityMapper.class);

    @Mapping(source = "idUni", target = "id")
    @Mapping(source = "nameUni", target = "name")
    @Mapping(source = "emailDomainUni", target = "emailDomain")
    UniversityDTO universityEntityToUniversityDTO(UniversityEntity universityEntity);

    @Mapping(source = "id", target = "idUni")
    @Mapping(source = "name", target = "nameUni")
    @Mapping(source = "emailDomain", target = "emailDomainUni")
    UniversityEntity universityDTOToUniversityEntity(UniversityDTO universityDTO);
}
