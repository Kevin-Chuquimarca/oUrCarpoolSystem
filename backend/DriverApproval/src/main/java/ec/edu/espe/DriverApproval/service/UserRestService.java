package ec.edu.espe.DriverApproval.service;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@RequiredArgsConstructor
public class UserRestService {
    public final RestTemplate restTemplate;

    public boolean changeUserRoleToDriver(Integer id) {
        String url = "http://localhost:8080/user/change-role-to-driver/" + id;
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PATCH, null, String.class);
        return response.getStatusCode().is2xxSuccessful();
    }
}
