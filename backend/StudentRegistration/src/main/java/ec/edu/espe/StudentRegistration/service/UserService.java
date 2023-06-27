package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.LoginResponseDTO;
import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.dto.UserLoginDTO;
import ec.edu.espe.StudentRegistration.entity.UserEntity;
import ec.edu.espe.StudentRegistration.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final PasswordGeneratorService passwordGeneratorService;
    private final EmailService emailService;

    public UserDTO getUserById(Integer id) {
        UserEntity userEntity = userRepository.findById(id).orElse(null);
        assert userEntity != null;
        return new UserDTO(userEntity.getIdUser(), userEntity.getIdUni(), userEntity.getEmailUser(), userEntity.getNameUser(), userEntity.getLastNameUser(), userEntity.getPhoneUser(),userEntity.getPhotoUser(), userEntity.getCareerUser());
    }

    public List<UserDTO> getAllUsers() {
        List<UserEntity> users = userRepository.findAll();
        if (!users.isEmpty()){
            List<UserDTO> usersDTO = new ArrayList<>();
            for (UserEntity user : users) {
                usersDTO.add(new UserDTO(user.getIdUser(), user.getIdUni(), user.getEmailUser(), user.getNameUser(), user.getLastNameUser(), user.getPhoneUser(), user.getPhotoUser(), user.getCareerUser()));
            }
            return usersDTO;
        }
        return new ArrayList<>();
    }

    public void saveUser(UserDTO userDTO) {
        String defaultPassword = passwordGeneratorService.generate();
        String encodedPassword = passwordEncoder.encode(defaultPassword);
        UserEntity user = new UserEntity(userDTO.getIdUni(), userDTO.getEmail(), userDTO.getName(), userDTO.getLastName(), encodedPassword, userDTO.getPhone(), userDTO.getPhoto(), userDTO.getCareer());
        userRepository.save(user);
        emailService.sendDefaultPassword(userDTO.getEmail(), defaultPassword);
    }

    public void updateUser(Integer id, UserDTO userDTO) {
        UserEntity oldUser = userRepository.findById(id).orElse(null);
        if (oldUser != null) {
            UserEntity newUser = new UserEntity(id, userDTO.getIdUni(), userDTO.getEmail(), userDTO.getName(), userDTO.getLastName(), oldUser.getPassUser(), userDTO.getPhone(), userDTO.getPhoto(), userDTO.getCareer());
            userRepository.save(newUser);
        }
    }

    public void deleteUser(Integer id) {
        userRepository.deleteById(id);
    }

    public LoginResponseDTO login(UserLoginDTO userLogin) {
        List<UserEntity> users = userRepository.findByEmail(userLogin.getEmail());
        if (!users.isEmpty() && passwordEncoder.matches(userLogin.getPassword(), users.get(0).getPassUser())) {
            return new LoginResponseDTO(true);
        } else {
            return new LoginResponseDTO(false);
        }
    }
}
