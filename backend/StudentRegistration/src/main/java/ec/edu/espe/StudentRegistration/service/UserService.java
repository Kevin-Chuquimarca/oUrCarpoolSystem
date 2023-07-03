package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.LoginResponseDTO;
import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.dto.UserLoginDTO;
import ec.edu.espe.StudentRegistration.entity.UserEntity;
import ec.edu.espe.StudentRegistration.mapper.UserMapper;
import ec.edu.espe.StudentRegistration.repository.UserRepository;
import ec.edu.espe.StudentRegistration.util.PasswordUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
        UserEntity user = new UserEntity(userDTO.getIdUni(), userDTO.getCi(), userDTO.getEmail(), userDTO.getName(), userDTO.getLastName(), encodedPassword, userDTO.getPhone(), userDTO.getPhoto(), userDTO.getCareer(), false);
        UserEntity userEntity = userRepository.save(user);
        emailService.sendDefaultPassword(userDTO.getEmail(), defaultPassword);
        return UserMapper.INSTANCE.userEntityToUserDTO(userEntity);
    }

    @Override
    public Optional<UserDTO> read(Integer id) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(id);
        if (userEntityOptional.isPresent()) {
            UserEntity userEntity = userEntityOptional.get();
            return Optional.of(UserMapper.INSTANCE.userEntityToUserDTO(userEntity));
        }
        return Optional.empty();
    }

    @Override
    public List<UserDTO> readAll() {
        List<UserEntity> users = userRepository.findAll();
        return users.stream().map(UserMapper.INSTANCE::userEntityToUserDTO).toList();
    }

    @Override
    public UserDTO update(Integer id, UserDTO userDTO) {
        UserEntity oldUser = userRepository.findById(id).orElse(null);
        if (oldUser != null) {
            UserEntity newUser = new UserEntity(id, userDTO.getIdUni(), userDTO.getCi(),userDTO.getEmail(), userDTO.getName(), userDTO.getLastName(), oldUser.getPassUser(), userDTO.getPhone(), userDTO.getPhoto(), userDTO.getCareer(), true);
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
            return (UserMapper.INSTANCE.userEntityToUserDTO(user));
        }
        return new UserDTO();
    }
}
