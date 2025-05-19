package com.Mystic_Gateway.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Mystic_Gateway.Config.DBConfig;

public class VehicleBookingService {

    public static boolean bookVehicle(int customerId, String name, String vehicleType, String pickupDate,
                                      String pickupLocation, String dropoffLocation)
            throws SQLException, ClassNotFoundException {

        Connection conn = DBConfig.getDbConnection();
        PreparedStatement vehicleStmt = null;
        PreparedStatement bookingStmt = null;
        ResultSet rs = null;

        conn.setAutoCommit(false); // Transaction begins

        try {
            // Step 1: Insert into vehicle_booking
            String vehicleInsert = "INSERT INTO vehicle_booking (customer_id, name, vehicle_type, pickup_date, pickup_location, dropoff_location) VALUES (?, ?, ?, ?, ?, ?)";

            vehicleStmt = conn.prepareStatement(vehicleInsert, Statement.RETURN_GENERATED_KEYS);
            vehicleStmt.setInt(1, customerId);
            vehicleStmt.setString(2, name);
            vehicleStmt.setString(3, vehicleType);
            vehicleStmt.setDate(4, java.sql.Date.valueOf(pickupDate));
            vehicleStmt.setString(5, pickupLocation);
            vehicleStmt.setString(6, dropoffLocation);

            int rowsInserted = vehicleStmt.executeUpdate();

            if (rowsInserted == 0) {
                conn.rollback();
                return false;
            }

            // Step 2: Get generated vehicle_booking_id
            rs = vehicleStmt.getGeneratedKeys();
            int vehicleBookingId = -1;
            if (rs.next()) {
                vehicleBookingId = rs.getInt(1);
            } else {
                conn.rollback();
                return false;
            }

            // Step 3: Insert into booking table
            String bookingInsert = "INSERT INTO booking (customer_id, booking_type, reference_id, booking_time, status) VALUES (?, ?, ?, NOW(), ?)";

            bookingStmt = conn.prepareStatement(bookingInsert);
            bookingStmt.setInt(1, customerId);
            bookingStmt.setString(2, "vehicle");
            bookingStmt.setInt(3, vehicleBookingId);
            bookingStmt.setString(4, "pending");

            int bookingRows = bookingStmt.executeUpdate();

            if (bookingRows == 0) {
                conn.rollback();
                return false;
            }

            conn.commit(); // Commit both inserts
            return true;

        } catch (SQLException e) {
            conn.rollback(); // In case of error
            e.printStackTrace();
            return false;
        } finally {
            if (rs != null) rs.close();
            if (vehicleStmt != null) vehicleStmt.close();
            if (bookingStmt != null) bookingStmt.close();
            if (conn != null) {
                conn.setAutoCommit(true);
                conn.close();
            }
        }
    }
}
