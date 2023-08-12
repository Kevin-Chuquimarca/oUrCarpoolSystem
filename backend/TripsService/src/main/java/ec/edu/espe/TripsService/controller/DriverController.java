package ec.edu.espe.TripsService.controller;

import ec.edu.espe.TripsService.dto.DriverDTO;
import ec.edu.espe.TripsService.service.DriverService;
import ec.edu.espe.TripsService.util.ImageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.core.io.Resource;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/driver")
@RequiredArgsConstructor
public class DriverController {
    private final DriverService driverService;

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<DriverDTO> getAll() {
        return driverService.readAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<DriverDTO> getById(@PathVariable Integer id) {
        return driverService.readById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<DriverDTO> post(@RequestBody DriverDTO driverDTO) {
        DriverDTO driverCreated = driverService.create(driverDTO);
        return (driverCreated != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(driverCreated) :
                ResponseEntity.badRequest().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<DriverDTO> put(@RequestBody DriverDTO driverDTO, @PathVariable Integer id) {
        DriverDTO driverUpdated = driverService.update(id, driverDTO);
        return (driverUpdated != null) ?
                ResponseEntity.ok(driverUpdated) :
                ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<DriverDTO> delete(@PathVariable Integer id) {
        driverService.deleteById(id);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/img")
    public ResponseEntity<Void> postProfilePicture(@RequestParam("plateCar") String plateCar, @RequestParam("photo") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            String fileName = Optional.ofNullable(file.getOriginalFilename()).orElse("");
            String fileNameToSave = plateCar + fileName.substring(fileName.lastIndexOf("."));
            ImageUtil.saveImageInLocal("img/cars/", fileNameToSave, file);
            return ResponseEntity.status(HttpStatus.CREATED).body(null);
        }
        return ResponseEntity.badRequest().build();
    }

    @GetMapping("/img/{fileName}")
    public ResponseEntity<Resource> getProfilePicture(@PathVariable String fileName) throws FileNotFoundException {
        String filePath = "img/cars/" + fileName;
        Resource resource = ImageUtil.loadImageAsResource(filePath);
        if (resource != null) {
            return ResponseEntity.status(HttpStatus.OK)
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(resource);
        }
        return ResponseEntity.notFound().build();
    }

}
