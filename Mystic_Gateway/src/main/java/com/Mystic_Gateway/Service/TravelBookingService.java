package com.Mystic_Gateway.Service;

import com.Mystic_Gateway.Config.DBConfig;
import java.sql.*;

public class TravelBookingService {

    public static boolean bookTravel(int customerId, String destination, int duration, String mode)
            throws SQLException, ClassNotFoundException {

        // Use try-with-resources to auto-close connection
        try (Connection conn = DBConfig.getDbConnection()) {
            conn.setAutoCommit(false);

            // Insert into travel_booking (use correct table name & columns)
            String insertTravel = "INSERT INTO travel_booking (customer_id, destination, duration, mode, booking_time) " +
                                  "VALUES (?, ?, ?, ?, NOW())";

            int travelId;
            try (PreparedStatement ps = conn.prepareStatement(insertTravel, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, customerId);
                ps.setString(2, destination);
                ps.setInt(3, duration);
                ps.setString(4, mode);

                int count = ps.executeUpdate();
                if (count == 0) {
                    conn.rollback();
                    return false;
                }

                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (!rs.next()) {
                        conn.rollback();
                        return false;
                    }
                    travelId = rs.getInt(1);
                }
            }

            // Insert into booking table (correct column: booking_time)
            String insertBooking = "INSERT INTO booking (customer_id, booking_type, reference_id, booking_time, status) " +
                                   "VALUES (?, ?, ?, NOW(), ?)";

            try (PreparedStatement ps2 = conn.prepareStatement(insertBooking)) {
                ps2.setInt(1, customerId);
                ps2.setString(2, "travel"); // better to keep consistent booking_type
                ps2.setInt(3, travelId);
                ps2.setString(4, "Confirmed");

                int count2 = ps2.executeUpdate();
                if (count2 == 0) {
                    conn.rollback();
                    return false;
                }
            }

            conn.commit();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;  // rethrow to caller or handle as needed
        }
    }
}
