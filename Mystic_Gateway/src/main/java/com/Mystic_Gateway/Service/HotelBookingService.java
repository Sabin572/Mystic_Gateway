package com.Mystic_Gateway.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Mystic_Gateway.Config.DBConfig;

public class HotelBookingService {

    public static boolean bookHotel(int customerId, String destination, String hotelName,
                                    String checkinDate, String checkoutDate, int guests)
            throws SQLException, ClassNotFoundException {

        Connection conn = DBConfig.getDbConnection();
        conn.setAutoCommit(false); // Transaction begins

        try {
            // Step 1: Insert into hotel_bookings
            String hotelInsert = "INSERT INTO hotel_bookings (customer_id, destination, hotel_name, checkin_date, checkout_date, guests, booking_time) VALUES (?, ?, ?, ?, ?, ?, NOW())";

            PreparedStatement hotelStmt = conn.prepareStatement(hotelInsert, Statement.RETURN_GENERATED_KEYS);
            hotelStmt.setInt(1, customerId);
            hotelStmt.setString(2, destination);
            hotelStmt.setString(3, hotelName);
            hotelStmt.setDate(4, java.sql.Date.valueOf(checkinDate));
            hotelStmt.setDate(5, java.sql.Date.valueOf(checkoutDate));
            hotelStmt.setInt(6, guests);

            int rowsInserted = hotelStmt.executeUpdate();
            if (rowsInserted == 0) {
                conn.rollback();
                return false;
            }

            // Step 2: Get generated hotel_booking_id
            ResultSet rs = hotelStmt.getGeneratedKeys();
            int hotelBookingId = -1;
            if (rs.next()) {
                hotelBookingId = rs.getInt(1);
            } else {
                conn.rollback();
                return false;
            }

            // Step 3: Insert into booking table
            String bookingInsert = "INSERT INTO booking (customer_id, booking_type, reference_id, booking_time, status) VALUES (?, ?, ?, NOW(), ?)";

            PreparedStatement bookingStmt = conn.prepareStatement(bookingInsert);
            bookingStmt.setInt(1, customerId);
            bookingStmt.setString(2, "hotel");
            bookingStmt.setInt(3, hotelBookingId);
            bookingStmt.setString(4, "pending");

            int bookingRows = bookingStmt.executeUpdate();
            if (bookingRows == 0) {
                conn.rollback();
                return false;
            }

            conn.commit(); // Commit both inserts
            return true;

        } catch (SQLException e) {
            conn.rollback();
            e.printStackTrace();
            return false;
        } finally {
            conn.setAutoCommit(true);
            conn.close();
        }
    }
}