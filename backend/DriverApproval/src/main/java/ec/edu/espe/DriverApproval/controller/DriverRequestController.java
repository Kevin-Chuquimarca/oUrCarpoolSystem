package ec.edu.espe.DriverApproval.controller;

import ec.edu.espe.DriverApproval.service.DriverRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/driver-request")
@RequiredArgsConstructor
public class DriverRequestController {
    private final DriverRequestService driverRequestService;
}
