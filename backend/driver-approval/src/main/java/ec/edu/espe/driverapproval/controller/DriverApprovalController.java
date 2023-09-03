package ec.edu.espe.driverapproval.controller;

import ec.edu.espe.driverapproval.dto.DriverRequestDTO;
import ec.edu.espe.driverapproval.service.DriverApprovalService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.FileNotFoundException;

@RestController
@RequestMapping("/v1/driver-approval")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class DriverApprovalController {
    private final DriverApprovalService driverApprovalService;

    @PutMapping("/approved")
    public ResponseEntity<DriverRequestDTO> approveDriverRequest(@RequestParam("id") Integer id, @RequestParam("message") String message) throws FileNotFoundException {
        boolean response = driverApprovalService.approveDriverRequest(id, message);
        return response ?
                ResponseEntity.status(HttpStatus.OK).build()
                :
                ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @PutMapping("/rejected")
    public ResponseEntity<DriverRequestDTO> rejectDriverRequest(@RequestParam("id") Integer id, @RequestParam("message") String message) {
        boolean response = driverApprovalService.rejectDriverRequest(id, message);
        return response ?
                ResponseEntity.status(HttpStatus.OK).build()
                :
                ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}
