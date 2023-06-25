package ec.edu.espe.StudentRegistration.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;

@Service
@RequiredArgsConstructor
public class PasswordGeneratorService {

    public String generate() {
        SecureRandom secureRandom = new SecureRandom();
        StringBuilder password = new StringBuilder();
        int PASSWORD_LENGTH = 8;
        String ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int randomIndex = secureRandom.nextInt(ALPHABET.length());
            password.append(ALPHABET.charAt(randomIndex));
        }
        return password.toString();
    }
}
