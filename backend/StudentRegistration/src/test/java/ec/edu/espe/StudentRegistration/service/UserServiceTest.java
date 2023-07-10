package ec.edu.espe.StudentRegistration.service;

import ec.edu.espe.StudentRegistration.dto.UserDTO;
import ec.edu.espe.StudentRegistration.entity.UserEntity;
import ec.edu.espe.StudentRegistration.mapper.UserMapper;
import ec.edu.espe.StudentRegistration.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

class UserServiceTest {

    @InjectMocks
    private UserService userService;

    @Mock
    private UserRepository userRepository;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }


    @Test
    void read() {
        UserDTO userDTO = new UserDTO(0, 1, "adm", "1727195420", "kschuquimarca@espe.edu.ec", "Kevin", "Chuquimarca", "0987654321", "photo", "Software Engineering");
        UserEntity userEntity = UserMapper.INSTANCE.userDTOToUserEntity(userDTO);
        when(userRepository.findById(0)).thenReturn(java.util.Optional.of(userEntity));
        Optional<UserDTO> userOp = userService.read(0);
        userOp.ifPresent(dto -> assertEquals(userDTO.getEmail(), dto.getEmail()));
    }

    @Test
    void readAll() {
        List<UserEntity> users = new ArrayList<>();
        users.add(new UserEntity(1, 1, "adm", "1727195420", "kschuquimarca@espe.edu.ec", "Kevin", "Chuquimarca", "$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a","0987654321", "1727195420.jpg","Software", false));
        users.add(new UserEntity(2, 1, "adm", "1727195421", "kschuquimarca1@espe.edu.ec", "Kevin1", "Chuquimarca1", "$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a","0987654321", "1727195421.jpg","Software", false));
        users.add(new UserEntity(3, 1, "adm", "1727195422", "kschuquimarca2@espe.edu.ec", "kevin2", "Chuquimarca2", "$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a","0987654321", "1727195422.jpg","Software", false));
        users.add(new UserEntity(4, 1, "adm", "1727195423", "kschuquimarca3@espe.edu.ec", "kevin3", "Chuquimarca3", "$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a","0987654321", "1727195423.jpg","Software", false));
        when(userRepository.findAll()).thenReturn(users);
        List<UserDTO> userDTOList = userService.readAll();
        assertEquals(4, userDTOList.size());
    }
}