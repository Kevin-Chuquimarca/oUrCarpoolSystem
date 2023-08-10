package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.LoginResponseDTO;
import ec.edu.espe.StudentRegistration.dto.MessageResponseDTO;
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
        if (!isUserRegistered(userDTO.getEmail()) && !isUserRegisteredCI(userDTO.getCi())) {
            String defaultPassword = PasswordUtil.generate();
            String encodedPassword = passwordEncoder.encode(defaultPassword);
            UserEntity user = new UserEntity(userDTO.getIdUni(), "psg", userDTO.getCi(), userDTO.getEmail(), userDTO.getName(), userDTO.getLastName(), encodedPassword, userDTO.getPhone(), userDTO.getPhoto(), userDTO.getCareer(), false);
            UserEntity userEntity = userRepository.save(user);
            emailService.sendDefaultPassword(userDTO.getEmail(), defaultPassword);
            return UserMapper.INSTANCE.toUserDTO(userEntity);
        }
        return null;
    }

    public boolean isUserRegistered(String email) {
        Optional<UserEntity> user = userRepository.findByEmail(email);
        return user.isPresent();
    }

    public boolean isUserRegisteredCI(String ci) {
        Optional<UserEntity> user = userRepository.findByCI(ci);
        return user.isPresent();
    }

    @Override
    public Optional<UserDTO> readById(Integer id) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(id);
        if (userEntityOptional.isPresent()) {
            UserEntity userEntity = userEntityOptional.get();
            return Optional.of(UserMapper.INSTANCE.toUserDTO(userEntity));
        }
        return Optional.empty();
    }

    @Override
    public List<UserDTO> readAll() {
        List<UserEntity> users = userRepository.findAll();
        return users.stream().map(UserMapper.INSTANCE::toUserDTO).toList();
    }

    @Override
    public UserDTO update(Integer id, UserDTO userDTO) {
        Optional<UserEntity> oldUser = userRepository.findById(id);
        if (oldUser.isPresent()) {
            UserEntity newUser = new UserEntity(id, userDTO.getIdUni(), "psg", userDTO.getCi(), userDTO.getEmail(), userDTO.getName(), userDTO.getLastName(), oldUser.get().getPassUser(), userDTO.getPhone(), userDTO.getPhoto(), userDTO.getCareer(), true);
            return UserMapper.INSTANCE.toUserDTO(userRepository.save(newUser));
        }
        return null;
    }

    @Override
    public void deleteById(Integer id) {
        userRepository.deleteById(id);
    }

    public LoginResponseDTO login(UserLoginDTO userLogin) {
        Optional<UserEntity> user = userRepository.findByEmail(userLogin.getEmail());
        if (user.isPresent() && passwordEncoder.matches(userLogin.getPassword(), user.get().getPassUser())) {
            return new LoginResponseDTO(true);
        } else {
            return new LoginResponseDTO(false);
        }
    }

    public Optional<UserDTO> readUserByEmail(String email) {
        Optional<UserEntity> user = userRepository.findByEmail(email);
        return user.map(UserMapper.INSTANCE::toUserDTO);
    }

    public Optional<MessageResponseDTO> changeUserPassword(Integer id, String newPassword) {
        Optional<UserEntity> userOp = userRepository.findById(id);
        if (userOp.isPresent()) {
            String encodedPassword = passwordEncoder.encode(newPassword);
            UserEntity user = userOp.get();
            user.setPassUser(encodedPassword);
            user.setFirstLoginUser(true);
            userRepository.save(user);
            return Optional.of(new MessageResponseDTO("Password changed successfully"));
        }
        return Optional.empty();
    }

    public boolean changeRoleToDriver(Integer id) {
        Optional<UserEntity> userOptional = userRepository.findById(id);
        if (userOptional.isPresent()) {
            UserEntity user = userOptional.get();
            user.setIdRl("drv");
            userRepository.save(user);
            return true;
        }
        return false;
    }
}
