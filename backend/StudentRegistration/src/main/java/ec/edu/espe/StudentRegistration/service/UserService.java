package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.entity.UserEntity;
import ec.edu.espe.StudentRegistration.repository.UserRepository;
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

    public List<UserEntity> getAllUsers(){
        return userRepository.findAll();
    }

    public void saveUser(UserDTO userDTO){
        System.out.println("values: " + userDTO.getEmailUser());
        UserEntity user = new UserEntity(userDTO.getIdUni(), userDTO.getEmailUser(), userDTO.getNameUser(), userDTO.getLastnameUser(), userDTO.getPassUser(), userDTO.getPhoneUser(), null, userDTO.getCareerUser());
        userRepository.save(user);
    }
}
