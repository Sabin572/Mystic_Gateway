package com.Mystic_Gateway.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Mystic_Gateway.Config.DBConfig;

public class FlightBookingService {

    public static boolean bookFlight(int customerId, String from, String to, String date, String travelClass, int passengers)
            throws SQLException, ClassNotFoundException {

        Connection conn = DBConfig.getDbConnection();

        // Auto-commit off to ensure both inserts succeed together
        conn.setAutoCommit(false);

        try {
            // Step 1: Insert into flight_bookings
            String flightInsert = "INSERT INTO flight_bookings (customer_id, from_location, to_location, departure_date, class, passengers, booking_time) " +
                                  "VALUES (?, ?, ?, ?, ?, ?, NOW())";

            PreparedStatement flightStmt = conn.prepareStatement(flightInsert, Statement.RETURN_GENERATED_KEYS);
            flightStmt.setInt(1, customerId);
            flightStmt.setString(2, from);
            flightStmt.setString(3, to);
            flightStmt.setString(4, date);
            flightStmt.setString(5, travelClass);
            flightStmt.setInt(6, passengers);

            int rowsAffected = flightStmt.executeUpdate();

            if (rowsAffected == 0) {
                conn.rollback();
                return false;
            }

            // Step 2: Get generated flight_booking ID
            ResultSet rs = flightStmt.getGeneratedKeys();
            int flightBookingId = -1;
            if (rs.next()) {
                flightBookingId = rs.getInt(1);
            } else {
                conn.rollback();
                return false;
            }

            // Step 3: Insert into booking table
            String bookingInsert = "INSERT INTO booking (customer_id, booking_type, reference_id, status) VALUES (?, ?, ?, ?)";

            PreparedStatement bookingStmt = conn.prepareStatement(bookingInsert);
            bookingStmt.setInt(1, customerId);
            bookingStmt.setString(2, "flight_booking");
            bookingStmt.setInt(3, flightBookingId);
            bookingStmt.setString(4, "Confirmed");

            int bookingRows = bookingStmt.executeUpdate();

            if (bookingRows == 0) {
                conn.rollback();
                return false;
            }

            conn.commit(); // Everything succeeded
            return true;

        } catch (SQLException e) {
            conn.rollback(); // Roll back in case of any error
            e.printStackTrace();
            return false;
        } finally {
            conn.setAutoCommit(true);
            conn.close();
        }
    }
}

