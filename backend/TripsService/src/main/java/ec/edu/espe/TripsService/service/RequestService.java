package ec.edu.espe.TripsService.service;

import ec.edu.espe.TripsService.dto.RequestDTO;
import ec.edu.espe.TripsService.entity.RequestEntity;
import ec.edu.espe.TripsService.mapper.RequestMapper;
import ec.edu.espe.TripsService.repository.RequestRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RequestService implements FacadeService<RequestDTO, Long> {
    private final RequestRepository requestRepository;

    @Override
    public RequestDTO create(RequestDTO requestDTO) {
        RequestEntity requestSaved = requestRepository.save(RequestMapper.INSTANCE.toRequestEntity(requestDTO));
        return RequestMapper.INSTANCE.toRequestDTO(requestSaved);
    }

    @Override
    public Optional<RequestDTO> readById(Long id) {
        return requestRepository.findById(id).map(RequestMapper.INSTANCE::toRequestDTO);
    }

    @Override
    public List<RequestDTO> readAll() {
        return null;
    }

    @Override
    public RequestDTO update(Long id, RequestDTO requestDTO) {
        if (requestRepository.findById(id).isPresent()){
            requestDTO.setId(id);
            RequestEntity requestUpdated = requestRepository.save(RequestMapper.INSTANCE.toRequestEntity(requestDTO));
            return RequestMapper.INSTANCE.toRequestDTO(requestUpdated);
        }
        return null;
    }

    @Override
    public void deleteById(Long id) {
        requestRepository.deleteById(id);
    }
}
