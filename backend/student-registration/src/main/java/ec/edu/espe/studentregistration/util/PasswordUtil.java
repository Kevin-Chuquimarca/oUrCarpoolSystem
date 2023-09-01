package ec.edu.espe.studentregistration.util;

import lombok.RequiredArgsConstructor;

import java.security.SecureRandom;

@RequiredArgsConstructor
public class PasswordUtil {

    public static String generate() {
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
