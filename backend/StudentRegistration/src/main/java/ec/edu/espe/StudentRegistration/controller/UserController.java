package ec.edu.espe.StudentRegistration.controller;

import ec.edu.espe.StudentRegistration.dto.MessageResponseDTO;
import ec.edu.espe.StudentRegistration.dto.LoginResponseDTO;
import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.dto.UserLoginDTO;
import ec.edu.espe.StudentRegistration.service.UserService;
import ec.edu.espe.StudentRegistration.util.ImageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/{id}")
    public ResponseEntity<UserDTO> getUserById(@PathVariable Integer id) {
        Optional<UserDTO> userDTOOptional = userService.read(id);
        return userDTOOptional.map(userDTO -> ResponseEntity.status(HttpStatus.OK).body(userDTO)).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body(null));
    }

    @GetMapping("/email/{email}")
    public ResponseEntity<UserDTO> getUserByEmail(@PathVariable String email) {
        return userService.readUserByEmail(email).map(userDTO -> ResponseEntity.status(HttpStatus.OK).body(userDTO)).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body(null));
    }

    @GetMapping("email/exist/{email}")
    public ResponseEntity<Boolean> existUserByEmail(@PathVariable String email) {
        boolean userExists = userService.isUserRegistered(email);
        return userExists ? ResponseEntity.status(HttpStatus.OK).body(null) : ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    @GetMapping("/all")
    @ResponseStatus(HttpStatus.OK)
    public List<UserDTO> getAllUsers() {
        return userService.readAll();
    }

    @PostMapping
    public ResponseEntity<UserDTO> saveUser(@RequestBody UserDTO userDTO) {
        UserDTO createdUser = userService.create(userDTO);
        return (createdUser != null) ?
                ResponseEntity.status(HttpStatus.CREATED).body(createdUser)
                :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    }


    @PutMapping("/{id}")
    public ResponseEntity<UserDTO> updateUser(@PathVariable Integer id, @RequestBody UserDTO userDTO) {
        UserDTO user = userService.update(id, userDTO);
        return (user != null) ?
                ResponseEntity.status(HttpStatus.OK).body(user)
                :
                ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteUser(@PathVariable Integer id) {
        userService.delete(id);
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
            ImageUtil.saveFile("img/user-profiles/", fileNameToSave, file);
            return ResponseEntity.status(HttpStatus.CREATED).body(new MessageResponseDTO("image uploaded successfully"));
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponseDTO("image not uploaded"));
    }

    @GetMapping("/img/{fileName}")
    public ResponseEntity<Resource> getProfilePicture(@PathVariable String fileName) throws FileNotFoundException {
        String filePath = "img/user-profiles/" + fileName;
        Resource resource = ImageUtil.loadFileAsResource(filePath);
        if (resource != null) {
            return ResponseEntity.status(HttpStatus.OK)
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(resource);
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    @PutMapping("/updatePassword/{id}")
    public ResponseEntity<MessageResponseDTO> updatePassword(@PathVariable Integer id, @RequestBody UserLoginDTO userLoginDTO) {
        Optional<MessageResponseDTO> messageResponseDTO = userService.changePassword(id, userLoginDTO.getPassword());
        return messageResponseDTO.map(responseDTO -> ResponseEntity.status(HttpStatus.OK).body(responseDTO)).orElseGet(() -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null));
    }
}
