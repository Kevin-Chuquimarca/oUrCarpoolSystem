package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.LoginRequest;
import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.entity.UserEntity;
import ec.edu.espe.StudentRegistration.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
        return new UserDTO(userEntity.getIdUni(), userEntity.getEmailUser(), userEntity.getNameUser(), userEntity.getLastnameUser(), userEntity.getPassUser(), userEntity.getPhoneUser(), userEntity.getCareerUser());
    }

    public List<UserEntity> getAllUsers() {
        return userRepository.findAll();
    }

    public void saveUser(UserDTO userDTO) {
        String defaultPassword = passwordGeneratorService.generate();
        String encodedPassword = passwordEncoder.encode(defaultPassword);
        UserEntity user = new UserEntity(userDTO.getIdUni(), userDTO.getEmailUser(), userDTO.getNameUser(), userDTO.getLastnameUser(), encodedPassword, userDTO.getPhoneUser(), null, userDTO.getCareerUser());
        userRepository.save(user);
        emailService.sendDefaultPassword(userDTO.getEmailUser(), defaultPassword);
    }

    public void updateUser(Integer id, UserDTO userDTO) {
        UserEntity user = new UserEntity(id, userDTO.getIdUni(), userDTO.getEmailUser(), userDTO.getNameUser(), userDTO.getLastnameUser(), userDTO.getPassUser(), userDTO.getPhoneUser(), null, userDTO.getCareerUser());
        userRepository.save(user);
    }

    public void deleteUser(Integer id){
        userRepository.deleteById(id);
    }

    public LoginRequest login(UserDTO userDTO) {
        List<UserEntity> users = userRepository.findByEmail(userDTO.getEmailUser());
        if (!users.isEmpty() && passwordEncoder.matches(userDTO.getPassUser(), users.get(0).getPassUser())) {
            return new LoginRequest(true);
        }else {
            return new LoginRequest(false);
        }
    }
}
