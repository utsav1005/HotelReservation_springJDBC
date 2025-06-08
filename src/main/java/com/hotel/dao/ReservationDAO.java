package com.hotel.dao;

import com.hotel.model.Reservation;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;

public class ReservationDAO {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Reservation getReservationById(int id) {
        String sql = "SELECT * FROM reservations WHERE id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{id}, new ReservationRowMapper());
        } catch (EmptyResultDataAccessException e) {
            return null; // Return null if no reservation is found
        }
    }

    public void addReservation(Reservation reservation) {
        String sql = "INSERT INTO reservations (userName, guestName, roomNumber, contactNumber, checkIn, checkOut) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                reservation.getUserName(),
                reservation.getGuestName(),
                reservation.getRoomNumber(),
                reservation.getContactNumber(),
                reservation.getCheckIn(),
                reservation.getCheckOut()
        );
    }

    public List<Reservation> getAllReservations() {
        String sql = "SELECT * FROM reservations";
        return jdbcTemplate.query(sql, new ReservationRowMapper());
    }

    public List<Reservation> getReservationsByUser(String username) {
        String sql = "SELECT * FROM reservations WHERE userName = ?";
        return jdbcTemplate.query(sql, new ReservationRowMapper(), username);
    }

    public void updateReservation(Reservation reservation) {
        String sql = "UPDATE reservations SET guestName = ?, roomNumber = ?, contactNumber = ?, checkIn = ?, checkOut = ? WHERE id = ?";
        jdbcTemplate.update(sql,
                reservation.getGuestName(),
                reservation.getRoomNumber(),
                reservation.getContactNumber(),
                reservation.getCheckIn(),
                reservation.getCheckOut(),
                reservation.getId() // Corrected: Update by 'id' instead of 'username'
        );
    }

    public void deleteReservation(int id) {
        String sql = "DELETE FROM reservations WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    public boolean isRoomAvailable(String roomNumber, String checkInDate, String checkOutDate) {
        String sql = "SELECT COUNT(*) FROM reservations WHERE roomNumber = ? AND "
                + "(checkIn < ? AND checkOut > ?)";
        // This query checks if there's any reservation for the same room within the dates
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{roomNumber, checkOutDate, checkInDate}, Integer.class);
        return count == 0; // If count is 0, room is available
    }

    private static class ReservationRowMapper implements RowMapper<Reservation> {

        @Override
        public Reservation mapRow(ResultSet rs, int rowNum) throws SQLException {
            Reservation r = new Reservation();
            r.setId(rs.getInt("id"));
            r.setUserName(rs.getString("userName"));
            r.setGuestName(rs.getString("guestName"));
            r.setRoomNumber(rs.getString("roomNumber"));
            r.setContactNumber(rs.getString("contactNumber"));
            r.setCheckIn(rs.getString("checkIn"));
            r.setCheckOut(rs.getString("checkOut"));
            return r;
        }
    }
}
