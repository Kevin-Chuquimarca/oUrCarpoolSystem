package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.dto.UserLoginDTO;
import ec.edu.espe.StudentRegistration.entity.UserEntity;
import ec.edu.espe.StudentRegistration.repository.UserRepository;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public UserDTO getUserById(Integer id) {
        UserEntity userEntity = userRepository.findById(id).orElse(null);
        assert userEntity != null;
        return new UserDTO(userEntity.getIdUni(), userEntity.getEmailUser(), userEntity.getNameUser(), userEntity.getLastnameUser(), userEntity.getPassUser(), userEntity.getPhoneUser(), userEntity.getCareerUser());
    }

    public List<UserEntity> getAllUsers() {
        return userRepository.findAll();
    }

    public void saveUser(UserDTO userDTO) {
        UserEntity user = new UserEntity(userDTO.getIdUni(), userDTO.getEmailUser(), userDTO.getNameUser(), userDTO.getLastnameUser(), userDTO.getPassUser(), userDTO.getPhoneUser(), null, userDTO.getCareerUser());
        userRepository.save(user);
    }

    public void updateUser(Integer id, UserDTO userDTO) {
        UserEntity user = new UserEntity(id, userDTO.getIdUni(), userDTO.getEmailUser(), userDTO.getNameUser(), userDTO.getLastnameUser(), userDTO.getPassUser(), userDTO.getPhoneUser(), null, userDTO.getCareerUser());
        userRepository.save(user);
    }

    public void deleteUser(Integer id){
        userRepository.deleteById(id);
    }

    public UserLoginDTO login(UserLoginDTO userLoginDTO) {
        List<UserEntity> users = userRepository.findByEmailAndPassword(userLoginDTO.getEmailUser(), userLoginDTO.getPassUser());
        if (!users.isEmpty()) {
            return new UserLoginDTO(users.get(0).getEmailUser(), users.get(0).getPassUser(), true);
        }
        return null;
    }
}
