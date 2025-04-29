package com.Mystic_Gateway.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Mystic_Gateway.Config.DBConfig;
import com.Mystic_Gateway.Service.RegisterService;
import org.mindrot.jbcrypt.BCrypt;

public class RegisterService {

    public static String registerUser(String firstName, String lastName, String username,
                                      String birthday, String phone, String email, String password)
            throws ClassNotFoundException, SQLException {

        try (Connection conn = DBConfig.getDbConnection()) {
            String query = "INSERT INTO registration (first_name, last_name, username, birthday, phone, email, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, username);
            stmt.setString(4, birthday);
            stmt.setString(5, phone);
            stmt.setString(6, email);
            stmt.setString(7, hashedPassword);

            int result = stmt.executeUpdate();

            if (result > 0) {
                return "success";
            } else {
                return "fail";
            }
        }
    }
}
