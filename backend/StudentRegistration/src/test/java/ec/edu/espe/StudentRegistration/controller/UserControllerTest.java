package ec.edu.espe.StudentRegistration.controller;

import ec.edu.espe.StudentRegistration.dto.LoginResponseDTO;
import ec.edu.espe.StudentRegistration.dto.MessageResponseDTO;
import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.dto.UserLoginDTO;
import ec.edu.espe.StudentRegistration.service.UserService;
import ec.edu.espe.StudentRegistration.util.ImageUtil;
import org.springframework.core.io.Resource;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockMultipartFile;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class UserControllerTest {

    @Mock
    private UserService userService;

    @InjectMocks
    private UserController userController;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void getUserById_ReturnsUserDTOWhenFound() {
        Integer userId = 1;
        UserDTO userDTO = new UserDTO(userId, 1234, "role", "1234567890", "test@example.com",
                "John", "Doe", "123456789", "photo.jpg", "Computer Science", false);
        when(userService.readById(userId)).thenReturn(Optional.of(userDTO));
        ResponseEntity<UserDTO> response = userController.getUserById(userId);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(userDTO, response.getBody());
    }

    @Test
    void getUserById_ReturnsNotFoundWhenUserNotFound() {
        Integer userId = 2;
        when(userService.readById(userId)).thenReturn(Optional.empty());
        ResponseEntity<UserDTO> response = userController.getUserById(userId);
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    void getUserByEmail_ReturnsUserDTOWhenFound() {
        String email = "test@example.com";
        UserDTO userDTO = new UserDTO(1, 1234, "role", "1234567890", "test@example.com",
                "John", "Doe", "123456789", "photo.jpg", "Computer Science", false);
        when(userService.readUserByEmail(email)).thenReturn(Optional.of(userDTO));
        ResponseEntity<UserDTO> response = userController.getUserByEmail(email);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(userDTO, response.getBody());
    }

    @Test
    void getUserByEmail_ReturnsNotFoundWhenUserNotFound() {
        String email = "test@example.com";
        when(userService.readUserByEmail(email)).thenReturn(Optional.empty());
        ResponseEntity<UserDTO> response = userController.getUserByEmail(email);
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    void isEmailRegistered_ReturnsTrueWhenEmailRegistered() {
        String email = "test@example.com";
        when(userService.isUserRegistered(email)).thenReturn(true);
        ResponseEntity<Boolean> response = userController.isEmailRegistered(email);
        assertEquals(HttpStatus.OK, response.getStatusCode());
    }

    @Test
    void isEmailRegistered_ReturnsFalseWhenEmailNotRegistered() {
        String email = "test@example.com";
        when(userService.isUserRegistered(email)).thenReturn(false);
        ResponseEntity<Boolean> response = userController.isEmailRegistered(email);
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertNotEquals(Boolean.TRUE, response.getBody());
    }

    @Test
    void getAllUsers_ReturnsListOfUsers() {
        List<UserDTO> users = Arrays.asList(
                new UserDTO(1, 1234, "role1", "1234567890", "test1@example.com",
                        "John", "Doe", "123456789", "photo1.jpg", "Computer Science", false),
                new UserDTO(2, 5678, "role2", "0987654321", "test2@example.com",
                        "Jane", "Smith", "987654321", "photo2.jpg", "Engineering", false)
        );
        when(userService.readAll()).thenReturn(users);
        List<UserDTO> response = userController.getAllUsers();
        assertEquals(users, response);
    }

    @Test
    void postUser_ReturnsCreatedUser() {
        UserDTO userDTO = new UserDTO(1, 1234, "role", "1234567890", "test@example.com",
                "John", "Doe", "123456789", "photo.jpg", "Computer Science", false);
        when(userService.create(userDTO)).thenReturn(userDTO);
        ResponseEntity<UserDTO> response = userController.postUser(userDTO);
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        assertEquals(userDTO, response.getBody());
    }

    @Test
    void postUser_ReturnsBadRequestWhenUserNotCreated() {
        UserDTO userDTO = new UserDTO(1, 1234, "role", "1234567890", "test@example.com",
                "John", "Doe", "123456789", "photo.jpg", "Computer Science",false);
        when(userService.create(userDTO)).thenReturn(null);
        ResponseEntity<UserDTO> response = userController.postUser(userDTO);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    void putUser_ReturnsUpdatedUser() {
        Integer userId = 1;
        UserDTO userDTO = new UserDTO(userId, 1234, "role", "1234567890", "test@example.com",
                "John", "Doe", "123456789", "photo.jpg", "Computer Science", false);
        when(userService.update(userId, userDTO)).thenReturn(userDTO);
        ResponseEntity<UserDTO> response = userController.putUser(userId, userDTO);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(userDTO, response.getBody());
    }

    @Test
    void putUser_ReturnsNoContentWhenUserNotUpdated() {
        Integer userId = 1;
        UserDTO userDTO = new UserDTO(userId, 1234, "role", "1234567890", "test@example.com",
                "John", "Doe", "123456789", "photo.jpg", "Computer Science", false);
        when(userService.update(userId, userDTO)).thenReturn(null);
        ResponseEntity<UserDTO> response = userController.putUser(userId, userDTO);
        assertEquals(HttpStatus.NO_CONTENT, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    void deleteUser_CallsDeleteById() {
        Integer userId = 1;
        assertDoesNotThrow(() -> userController.deleteUser(userId));
        verify(userService, times(1)).deleteById(userId);
    }

    @Test
    void login_ReturnsLoginResponseDTO() {
        UserLoginDTO userLoginDTO = new UserLoginDTO("test@example.com", "password");
        LoginResponseDTO loginResponseDTO = new LoginResponseDTO();
        when(userService.login(userLoginDTO)).thenReturn(loginResponseDTO);
        LoginResponseDTO response = userController.login(userLoginDTO);
        assertNotNull(response);
        assertEquals(loginResponseDTO, response);
    }

    @Test
    void postProfilePicture_ReturnsCreatedStatusWhenImageUploaded() throws IOException {
        String ci = "1234567890";
        MockMultipartFile file = new MockMultipartFile("photo", "photo.jpg", MediaType.IMAGE_JPEG_VALUE, "Some image content".getBytes());
        ResponseEntity<MessageResponseDTO> response = userController.postProfilePicture(ci, file);
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        assertEquals("image uploaded successfully", Objects.requireNonNull(response.getBody()).getMessage());
    }

    @Test
    void postProfilePicture_ReturnsBadRequestWhenImageNotUploaded() throws IOException {
        String ci = "1234567890";
        MockMultipartFile file = new MockMultipartFile("photo", "", MediaType.IMAGE_JPEG_VALUE, "".getBytes());
        ResponseEntity<MessageResponseDTO> response = userController.postProfilePicture(ci, file);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals("image not uploaded", Objects.requireNonNull(response.getBody()).getMessage());
    }

    @Test
    void getProfilePicture_ReturnsNotFoundWhenFileNotExists() throws IOException {
        String fileName = "nonexistent.jpg";
        when(ImageUtil.loadImageAsResource("img/user-profiles/" + fileName)).thenReturn(null);
        ResponseEntity<Resource> response = userController.getProfilePicture(fileName);
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    void putUserPassword_ReturnsMessageResponseDTOWhenPasswordChanged() {
        Integer userId = 1;
        String newPassword = "password";
        Optional<MessageResponseDTO> messageResponseDTO = Optional.of(new MessageResponseDTO("Password changed successfully"));
        when(userService.changeUserPassword(userId, newPassword)).thenReturn(messageResponseDTO);
        ResponseEntity<MessageResponseDTO> response = userController.putUserPassword(userId, new UserLoginDTO("test@email.com", "password"));
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(messageResponseDTO.get(), response.getBody());
    }

    @Test
    void putUserPassword_ReturnsBadRequestWhenPasswordNotChanged() {
        Integer userId = 1;
        String newPassword = "newPassword";
        Optional<MessageResponseDTO> messageResponseDTO = Optional.empty();
        when(userService.changeUserPassword(userId, newPassword)).thenReturn(messageResponseDTO);
        ResponseEntity<MessageResponseDTO> response = userController.putUserPassword(userId, new UserLoginDTO("test@email.com", "password"));
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());
    }
}