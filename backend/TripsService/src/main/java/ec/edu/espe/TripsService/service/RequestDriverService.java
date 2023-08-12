package ec.edu.espe.TripsService.service;

import ec.edu.espe.TripsService.dto.RequestDTO;
import ec.edu.espe.TripsService.mapper.RequestMapper;
import ec.edu.espe.TripsService.repository.RequestRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RequestDriverService {
    private final RequestRepository requestRepository;

    public List<RequestDTO> readAllByIdDri(Long idDri){
        return requestRepository.findAllByIdDri(idDri).stream().map(RequestMapper.INSTANCE::toRequestDTO).toList();
    }
}
