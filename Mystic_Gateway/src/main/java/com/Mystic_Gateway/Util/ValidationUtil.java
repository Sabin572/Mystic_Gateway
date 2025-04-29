package com.Mystic_Gateway.Util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidationUtil {

    // Validate if the email format is correct
    public static boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    // Validate if the password meets basic security criteria
    public static boolean isValidPassword(String password) {
        // Password must be at least 8 characters, include at least one digit, one uppercase letter, and one special character
        String passwordRegex = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{8,}$";
        Pattern pattern = Pattern.compile(passwordRegex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    // Validate if the phone number is in a valid format (e.g., 10 digits)
    public static boolean isValidPhoneNumber(String phoneNumber) {
        String phoneRegex = "^[0-9]{10}$";
        Pattern pattern = Pattern.compile(phoneRegex);
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }

    // Validate if a string is not empty or null
    public static boolean isNotEmpty(String str) {
        return str != null && !str.trim().isEmpty();
    }

    // Validate if the username contains only alphanumeric characters and is between 5-15 characters
    public static boolean isValidUsername(String username) {
        String usernameRegex = "^[a-zA-Z0-9]{5,15}$";
        Pattern pattern = Pattern.compile(usernameRegex);
        Matcher matcher = pattern.matcher(username);
        return matcher.matches();
    }

    // Validate if the date is in the correct format (yyyy-MM-dd)
    public static boolean isValidDate(String date) {
        String dateRegex = "^\\d{4}-\\d{2}-\\d{2}$";
        Pattern pattern = Pattern.compile(dateRegex);
        Matcher matcher = pattern.matcher(date);
        return matcher.matches();
    }
}
