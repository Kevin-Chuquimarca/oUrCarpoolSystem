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
import java.util.NoSuchElementException;
import java.util.Optional;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public UserDTO getUserById(@PathVariable Integer id) {
        Optional<UserDTO> userDTOOptional = userService.read(id);
        if (userDTOOptional.isPresent()) {
            return userDTOOptional.get();
        }
        throw new NoSuchElementException("User not found");
    }

    @GetMapping("/email/{email}")
    @ResponseStatus(HttpStatus.OK)
    public UserDTO getUserByEmail(@PathVariable String email) {
        return userService.readUserByEmail(email);
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
                ResponseEntity.status(HttpStatus.CONFLICT).body(null);
    }


    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public UserDTO updateUser(@PathVariable Integer id, @RequestBody UserDTO userDTO) {
        return userService.update(id, userDTO);
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
    @ResponseStatus(HttpStatus.OK)
    public MessageResponseDTO postProfilePicture(@RequestParam("CI") String ci, @RequestParam("photo") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            String fileName = Optional.ofNullable(file.getOriginalFilename()).orElse("");
            String fileNameToSave = ci + fileName.substring(fileName.lastIndexOf("."));
            ImageUtil.saveFile("img/user-profiles/", fileNameToSave, file);
            return new MessageResponseDTO("image uploaded successfully");
        }
        return new MessageResponseDTO("image not uploaded");
    }

    @GetMapping("/img/{fileName}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<Resource> getProfilePicture(@PathVariable String fileName) throws FileNotFoundException {
        String filePath = "img/user-profiles/" + fileName;
        Resource resource = ImageUtil.loadFileAsResource(filePath);
        return ResponseEntity.ok()
                .contentType(MediaType.IMAGE_JPEG)
                .body(resource);
    }

    @PutMapping("/updatePassword/{id}")
    @ResponseStatus(HttpStatus.OK)
    public MessageResponseDTO updatePassword(@PathVariable Integer id, @RequestBody UserLoginDTO userLoginDTO) {
        return userService.changePassword(id, userLoginDTO.getPassword());
    }
}
