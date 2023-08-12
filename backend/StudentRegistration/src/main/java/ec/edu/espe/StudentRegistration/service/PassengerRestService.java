package ec.edu.espe.StudentRegistration.service;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PassengerRestService {
    private final RestTemplate restTemplate;

    public void createPassengerInTripService(Integer codUser){
        String url = "http://localhost:8082/passenger";
        Map<String, Integer> request = new HashMap<>();
        request.put("codUser", codUser);
        restTemplate.postForEntity(url, request, Void.class);
    }
}
