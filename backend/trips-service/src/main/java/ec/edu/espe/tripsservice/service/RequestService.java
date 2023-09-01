package ec.edu.espe.tripsservice.service;

import ec.edu.espe.tripsservice.dto.PassengerDTO;
import ec.edu.espe.tripsservice.dto.RequestDTO;
import ec.edu.espe.tripsservice.dto.TripDTO;
import ec.edu.espe.tripsservice.entity.RequestEntity;
import ec.edu.espe.tripsservice.mapper.RequestMapper;
import ec.edu.espe.tripsservice.repository.RequestRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RequestService implements FacadeService<RequestDTO, Long> {
    private final RequestRepository requestRepository;
    private final PassengerService passengerService;
    private final TripService tripService;

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
        if (requestRepository.findById(id).isPresent()) {
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

    public List<RequestDTO> readAllByIdDri(Long idDri) {
        return requestRepository.findAllByIdDri(idDri).stream()
                .map(RequestMapper.INSTANCE::toRequestDTO)
                .toList();
    }

    public boolean accept(long id) {
        Optional<RequestEntity> request = requestRepository.findById(id);
        if (request.isPresent()) {
            Optional<TripDTO> tripDTO = tripService.readByIdDriAndAvailableTrip(request.get().getIdDri());
            Optional<PassengerDTO> passengerDTO = passengerService.readById(request.get().getIdPas());
            if (passengerDTO.isPresent() && tripDTO.isPresent() && tripDTO.get().getFreeSeats() > 0) {
                tripDTO.get().setFreeSeats(tripDTO.get().getFreeSeats() - 1);
                tripService.update(tripDTO.get().getId(), tripDTO.get());
                passengerDTO.get().setIdTrip(tripDTO.get().getId());
                passengerService.update(passengerDTO.get().getId(), passengerDTO.get());
                request.get().setStateReq("A");
                requestRepository.save(request.get());
                return true;
            }
        }
        return false;
    }

    public boolean deny(long id) {
        Optional<RequestEntity> request = requestRepository.findById(id);
        if (request.isPresent()) {
            request.get().setStateReq("R");
            requestRepository.save(request.get());
            return true;
        }
        return false;
    }
}
