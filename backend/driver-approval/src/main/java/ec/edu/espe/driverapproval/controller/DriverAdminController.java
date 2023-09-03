package ec.edu.espe.driverapproval.controller;

import ec.edu.espe.driverapproval.dto.DriverAdminDTO;
import ec.edu.espe.driverapproval.service.DriverAdminService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/v1/driver-admin")
@RequiredArgsConstructor
public class DriverAdminController {
    private final DriverAdminService driverAdminService;

    @GetMapping("/all")
    public List<DriverAdminDTO> getAll() {
        return driverAdminService.readAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<DriverAdminDTO> getById(@PathVariable Integer id) {
        Optional<DriverAdminDTO> driverDTO = driverAdminService.readById(id);
        return driverDTO.map(driver -> ResponseEntity.status(HttpStatus.OK).body(driver))
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }
}
