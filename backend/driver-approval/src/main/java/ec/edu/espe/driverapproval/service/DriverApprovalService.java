package ec.edu.espe.driverapproval.service;

import ec.edu.espe.driverapproval.dto.DriverTripServiceDTO;
import ec.edu.espe.driverapproval.entity.DriverRequestEntity;
import ec.edu.espe.driverapproval.repository.DriverRequestRepository;
import ec.edu.espe.driverapproval.util.ImageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.io.FileNotFoundException;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DriverApprovalService {
    private final DriverRequestRepository driverRequestRepository;
    private final RestTemplate restTemplate;

    public boolean approveDriverRequest(Integer id, String message) throws FileNotFoundException {
        Optional<DriverRequestEntity> driverRequestEntity = driverRequestRepository.findById(id);
        if (driverRequestEntity.isPresent()) {
            DriverRequestEntity dre = driverRequestEntity.get();
            dre.setStateDr("A");
            dre.setMessageDr(message);
            DriverTripServiceDTO driver = new DriverTripServiceDTO(dre.getCodUserDr(), 0L, dre.getPlateCarDr(), dre.getPhotoCarDr(), dre.getCodUserDr());
            if (changeUserRoleToDriver(dre.getCodUserDr()) && createDriverInTripService(driver) && saveDriverCarPhoto(dre.getPlateCarDr(), dre.getPhotoCarDr())) {
                driverRequestRepository.save(dre);
                return true;
            }
        }
        return false;
    }

    public boolean rejectDriverRequest(Integer id, String message) {
        Optional<DriverRequestEntity> driverRequestEntity = driverRequestRepository.findById(id);
        if (driverRequestEntity.isPresent()) {
            DriverRequestEntity dre = driverRequestEntity.get();
            dre.setStateDr("R");
            dre.setMessageDr(message);
            driverRequestRepository.save(dre);
            return true;
        }
        return false;
    }

    public boolean changeUserRoleToDriver(Integer id) {
        String url = "http://localhost:8080/user/change-role-to-driver/" + id;
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PATCH, null, String.class);
        return response.getStatusCode().is2xxSuccessful();
    }

    public boolean createDriverInTripService(DriverTripServiceDTO driver) {
        String url = "http://localhost:8082/driver";
        ResponseEntity<DriverTripServiceDTO> response = restTemplate.postForEntity(url, driver, DriverTripServiceDTO.class);
        return response.getStatusCode().is2xxSuccessful();
    }

    public boolean saveDriverCarPhoto(String plateCar, String photoCar) throws FileNotFoundException {
        String url = "http://localhost:8082/driver/img";
        Resource resource = ImageUtil.loadImageAsResource("img/cars/" + photoCar);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("plateCar", plateCar);
        body.add("photo", resource);
        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);
        ResponseEntity<Void> response = restTemplate.exchange(
                url,
                HttpMethod.POST,
                requestEntity,
                Void.class
        );
        return response.getStatusCode().is2xxSuccessful();
    }
}
