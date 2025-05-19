package com.Mystic_Gateway.Model;

public class AdminModel {
    private int adminId;
    private String username;
    private String fullName;
    private String email;
    private String hashedPassword;

    // Default constructor
    public AdminModel() {
    }

    // Parameterized constructor
    public AdminModel(int adminId, String username, String fullName, String email, String hashedPassword) {
        this.adminId = adminId;
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.hashedPassword = hashedPassword;
    }

    // Getters and Setters
    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHashedPassword() {
        return hashedPassword;
    }

    public void setHashedPassword(String hashedPassword) {
        this.hashedPassword = hashedPassword;
    }

    @Override
    public String toString() {
        return "AdminModel{" +
                "adminId=" + adminId +
                ", username='" + username + '\'' +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
