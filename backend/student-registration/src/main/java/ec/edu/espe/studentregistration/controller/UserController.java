package ec.edu.espe.studentregistration.controller;

import ec.edu.espe.studentregistration.dto.MessageResponseDTO;
import ec.edu.espe.studentregistration.dto.LoginResponseDTO;
import ec.edu.espe.studentregistration.dto.UserDTO;
import ec.edu.espe.studentregistration.dto.UserLoginDTO;
import ec.edu.espe.studentregistration.service.UserService;
import ec.edu.espe.studentregistration.util.ImageUtil;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import lombok.RequiredArgsConstructor;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/v1/user")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/{id}")
    public ResponseEntity<UserDTO> getById(@PathVariable Integer id) {
        Optional<UserDTO> userDTOOptional = userService.readById(id);
        return userDTOOptional.map(userDTO -> ResponseEntity.status(HttpStatus.OK).body(userDTO)).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body(null));
    }

    @GetMapping("/email/{email}")
    public ResponseEntity<UserDTO> getByEmail(@PathVariable String email) {
        return userService.readUserByEmail(email).map(userDTO -> ResponseEntity.status(HttpStatus.OK).body(userDTO)).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body(null));
    }

    @GetMapping("email/exist/{email}")
    public ResponseEntity<Boolean> isEmailRegistered(@PathVariable String email) {
        boolean userExists = userService.isUserRegistered(email);
        return userExists ? ResponseEntity.status(HttpStatus.OK).body(null) : ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<UserDTO> getAll() {
        return userService.readAll();
    }

    @PostMapping
    public ResponseEntity<UserDTO> post(@RequestBody UserDTO userDTO) {
        UserDTO createdUser = userService.create(userDTO);
        return (createdUser != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(createdUser)
                :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    }


    @PutMapping("/{id}")
    public ResponseEntity<UserDTO> putById(@PathVariable Integer id, @RequestBody UserDTO userDTO) {
        UserDTO user = userService.update(id, userDTO);
        return (user != null) ?
                ResponseEntity.status(HttpStatus.OK).body(user)
                :
                ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteById(@PathVariable Integer id) {
        userService.deleteById(id);
    }

    @PostMapping("/login")
    @ResponseStatus(HttpStatus.OK)
    public LoginResponseDTO login(@RequestBody UserLoginDTO userLogin) {
        return userService.login(userLogin);
    }

    @PostMapping("/img")
    public ResponseEntity<MessageResponseDTO> postProfilePicture(@RequestParam("CI") String ci, @RequestParam("photo") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            String fileName = Optional.ofNullable(file.getOriginalFilename()).orElse("");
            String fileNameToSave = ci + fileName.substring(fileName.lastIndexOf("."));
            ImageUtil.saveImageInLocal("img/user-profiles/", fileNameToSave, file);
            return ResponseEntity.status(HttpStatus.CREATED).body(new MessageResponseDTO("image uploaded successfully"));
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponseDTO("image not uploaded"));
    }

    @GetMapping("/img/{fileName}")
    public ResponseEntity<Resource> getProfilePicture(@PathVariable String fileName) throws FileNotFoundException {
        String filePath = "img/user-profiles/" + fileName;
        Resource resource = ImageUtil.loadImageAsResource(filePath);
        if (resource != null) {
            return ResponseEntity.status(HttpStatus.OK)
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(resource);
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    @PutMapping("/update-password/{id}")
    public ResponseEntity<MessageResponseDTO> putPassword(@PathVariable Integer id, @RequestBody UserLoginDTO userLoginDTO) {
        Optional<MessageResponseDTO> messageResponseDTO = userService.changeUserPassword(id, userLoginDTO.getPassword());
        return messageResponseDTO.map(responseDTO -> ResponseEntity.status(HttpStatus.OK).body(responseDTO)).orElseGet(() -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null));
    }

    @PatchMapping("/change-role-to-driver/{id}")
    public ResponseEntity<String> changeRoleToDriver(@PathVariable Integer id) {
        boolean success = userService.changeRoleToDriver(id);
        if (success) {
            return ResponseEntity.ok("Role changed to driver successfully.");
        } else {
            return ResponseEntity.badRequest().body("Failed to change role to driver.");
        }
    }
}
