package com.Mystic_Gateway.Util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    // Method to hash a password
    public static String hashPassword(String plainPassword) {
        // Generate a salt and hash the password
        String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt());
        return hashedPassword;
    }

    // Method to check if the entered password matches the stored hashed password
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        // Check if the entered password matches the hashed password stored in the database
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }

    public static void main(String[] args) {
        // Example usage of the PasswordUtil class
        String plainPassword = "mySecretPassword123";
        
        // Hash the password before storing it in the database
        String hashedPassword = hashPassword(plainPassword);
        System.out.println("Hashed Password: " + hashedPassword);

        // Verify if the entered password matches the hashed one
        boolean isPasswordCorrect = checkPassword(plainPassword, hashedPassword);
        System.out.println("Password Correct: " + isPasswordCorrect);  // Should print true
    }
}
