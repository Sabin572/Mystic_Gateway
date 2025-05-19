package com.Mystic_Gateway.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Mystic_Gateway.Config.DBConfig;
import com.Mystic_Gateway.Service.RegisterService;
import org.mindrot.jbcrypt.BCrypt;

public class RegisterService {

	public static int registerUser(String firstName, String lastName, String username,
            String birthday, String phone, String email, String password)
throws ClassNotFoundException, SQLException {

try (Connection conn = DBConfig.getDbConnection()) {
String query = "INSERT INTO customer (first_name, last_name, username, birthday, phone, email, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

// Enable retrieval of auto-generated keys
PreparedStatement stmt = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
stmt.setString(1, firstName);
stmt.setString(2, lastName);
stmt.setString(3, username);
stmt.setString(4, birthday);
stmt.setString(5, phone);
stmt.setString(6, email);
stmt.setString(7, hashedPassword);

int result = stmt.executeUpdate();

if (result > 0) {
// Retrieve the auto-generated customer_id
try (var rs = stmt.getGeneratedKeys()) {
if (rs.next()) {
 int customerId = rs.getInt(1);  // <-- This is your new customer_id
 return customerId;
}
}
}

return -1; // Indicates failure
}
}
}