package ec.edu.espe.DriverApproval.controller;

import ec.edu.espe.DriverApproval.dto.DriverRequestDTO;
import ec.edu.espe.DriverApproval.dto.MessageResponseDTO;
import ec.edu.espe.DriverApproval.service.DriverRequestService;
import ec.edu.espe.DriverApproval.util.ImageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/driver-request")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class DriverRequestController {
    private final DriverRequestService driverRequestService;

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<DriverRequestDTO> getAll() {
        return driverRequestService.readAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<DriverRequestDTO> getDriverRequestById(@PathVariable Integer id) {
        Optional<DriverRequestDTO> driverRequestDTO = driverRequestService.readById(id);
        return driverRequestDTO.map(driverRequest -> ResponseEntity.status(HttpStatus.OK).body(driverRequest))
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }

    @GetMapping("/pending/all")
    @ResponseStatus(HttpStatus.OK)
    public List<DriverRequestDTO> getAllPending() {
        return driverRequestService.readAllPending();
    }

    @GetMapping("/approved/all")
    @ResponseStatus(HttpStatus.OK)
    public List<DriverRequestDTO> getAllApproved() {
        return driverRequestService.readAllApproved();
    }

    @GetMapping("/rejected/all")
    @ResponseStatus(HttpStatus.OK)
    public List<DriverRequestDTO> getAllRejected() {
        return driverRequestService.readAllRejected();
    }

    @PostMapping
    public ResponseEntity<DriverRequestDTO> createDriverRequest(@RequestBody DriverRequestDTO driverRequestDTO) {
        DriverRequestDTO driverSaved = driverRequestService.create(driverRequestDTO);
        return (driverSaved == null) ?
                ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                :
                ResponseEntity.status(HttpStatus.CREATED).body(driverSaved);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteDriverRequest(@PathVariable Integer id) {
        driverRequestService.deleteById(id);
    }

    @PostMapping("/license-img")
    public ResponseEntity<MessageResponseDTO> postLicensePicture(@RequestParam("plateCar") String plateCar, @RequestParam("photo") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            String fileName = Optional.ofNullable(file.getOriginalFilename()).orElse("");
            String fileNameToSave = plateCar + fileName.substring(fileName.lastIndexOf("."));
            ImageUtil.saveImageInLocal("img/licenses/", fileNameToSave, file);
            return ResponseEntity.status(HttpStatus.CREATED).body(new MessageResponseDTO("image uploaded successfully"));
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponseDTO("image not uploaded"));
    }

    @GetMapping("/license-img/{fileName}")
    public ResponseEntity<Resource> getLicensePicture(@PathVariable String fileName) throws FileNotFoundException {
        String filePath = "img/licenses/" + fileName;
        Resource resource = ImageUtil.loadImageAsResource(filePath);
        if (resource != null) {
            return ResponseEntity.status(HttpStatus.OK)
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(resource);
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    @PostMapping("/car-img")
    public ResponseEntity<MessageResponseDTO> postCarPicture(@RequestParam("plateCar") String plateCar, @RequestParam("photo") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            String fileName = Optional.ofNullable(file.getOriginalFilename()).orElse("");
            String fileNameToSave = plateCar + fileName.substring(fileName.lastIndexOf("."));
            ImageUtil.saveImageInLocal("img/cars/", fileNameToSave, file);
            return ResponseEntity.status(HttpStatus.CREATED).body(new MessageResponseDTO("image uploaded successfully"));
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponseDTO("image not uploaded"));
    }

    @GetMapping("/car-img/{fileName}")
    public ResponseEntity<Resource> getCarPicture(@PathVariable String fileName) throws FileNotFoundException {
        String filePath = "img/cars/" + fileName;
        Resource resource = ImageUtil.loadImageAsResource(filePath);
        if (resource != null) {
            return ResponseEntity.status(HttpStatus.OK)
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(resource);
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    @PutMapping("/approved")
    public ResponseEntity<DriverRequestDTO> approveDriverRequest(@RequestParam("id") Integer id, @RequestParam("message") String message) {
        boolean response = driverRequestService.approveDriverRequest(id, message);
        return response ?
                ResponseEntity.status(HttpStatus.OK).build()
                :
                ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @PutMapping("/rejected")
    public ResponseEntity<DriverRequestDTO> rejectDriverRequest(@RequestParam("id") Integer id, @RequestParam("message") String message) {
        boolean response = driverRequestService.rejectDriverRequest(id, message);
        return response ?
                ResponseEntity.status(HttpStatus.OK).build()
                :
                ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}
