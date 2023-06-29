package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.LoginResponseDTO;
import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.dto.UserLoginDTO;
import ec.edu.espe.StudentRegistration.entity.UserEntity;
import ec.edu.espe.StudentRegistration.repository.UserRepository;
import ec.edu.espe.StudentRegistration.util.PasswordUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService implements FacadeService<UserDTO, Integer> {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;

    @Override
    public UserDTO create(UserDTO userDTO) {
        String defaultPassword = PasswordUtil.generate();
        String encodedPassword = passwordEncoder.encode(defaultPassword);
        UserEntity user = new UserEntity(userDTO.getIdUni(), userDTO.getCi(), userDTO.getEmail(), userDTO.getName(), userDTO.getLastName(), encodedPassword, userDTO.getPhone(), userDTO.getPhoto(), userDTO.getCareer());
        userRepository.save(user);
        emailService.sendDefaultPassword(userDTO.getEmail(), defaultPassword);
        return userDTO;
    }

    @Override
    public Optional<UserDTO> read(Integer id) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(id);
        if (userEntityOptional.isPresent()) {
            UserEntity userEntity = userEntityOptional.get();
            return Optional.of(new UserDTO(userEntity.getIdUser(), userEntity.getIdUni(), userEntity.getCiUser(), userEntity.getEmailUser(), userEntity.getNameUser(), userEntity.getLastNameUser(), userEntity.getPhoneUser(), userEntity.getPhotoUser(), userEntity.getCareerUser()));
        }
        return Optional.empty();
    }

    @Override
    public List<UserDTO> readAll() {
        List<UserEntity> users = userRepository.findAll();
        if (!users.isEmpty()){
            List<UserDTO> usersDTO = new ArrayList<>();
            for (UserEntity user : users) {
                usersDTO.add(new UserDTO(user.getIdUser(), user.getIdUni(), user.getCiUser(), user.getEmailUser(), user.getNameUser(), user.getLastNameUser(), user.getPhoneUser(), user.getPhotoUser(), user.getCareerUser()));
            }
            return usersDTO;
        }
        return new ArrayList<>();
    }

    @Override
    public UserDTO update(Integer id, UserDTO userDTO) {
        UserEntity oldUser = userRepository.findById(id).orElse(null);
        if (oldUser != null) {
            UserEntity newUser = new UserEntity(id, userDTO.getIdUni(), userDTO.getCi(),userDTO.getEmail(), userDTO.getName(), userDTO.getLastName(), oldUser.getPassUser(), userDTO.getPhone(), userDTO.getPhoto(), userDTO.getCareer());
            userRepository.save(newUser);
        }
        return userDTO;
    }

    @Override
    public void delete(Integer id) {
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

    public UserDTO readUserByEmail(String email) {
        List<UserEntity> users = userRepository.findByEmail(email);
        if (!users.isEmpty()) {
            UserEntity user = users.get(0);
            return new UserDTO(user.getIdUser(), user.getIdUni(), user.getCiUser(), user.getEmailUser(), user.getNameUser(), user.getLastNameUser(), user.getPhoneUser(), user.getPhotoUser(), user.getCareerUser());
        }
        return new UserDTO();
    }
}
