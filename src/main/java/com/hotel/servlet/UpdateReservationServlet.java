package com.hotel.servlet;

import com.hotel.dao.ReservationDAO;
import com.hotel.model.Reservation;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;

public class UpdateReservationServlet extends HttpServlet {

    private ReservationDAO reservationDAO;

    @Override
    public void init() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        reservationDAO = (ReservationDAO) context.getBean("reservationDAO");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            
            response.sendRedirect("viewReservation.jsp?error=" + URLEncoder.encode("Missing reservation ID", "UTF-8"));
            return;
        }

        try {
            int id = Integer.parseInt(idParam.trim());
            Reservation reservation = reservationDAO.getReservationById(id);

            if (reservation != null) {
                request.setAttribute("reservation", reservation);
                request.getRequestDispatcher("updateReservation.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Reservation not found.");
                request.getRequestDispatcher("viewReservation.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid reservation ID.");
            request.getRequestDispatcher("viewReservation.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect("viewReservation.jsp?error=" + URLEncoder.encode("Missing reservation ID", "UTF-8"));
            return;
        }

        try {
            int id = Integer.parseInt(idParam.trim());
            Reservation existingReservation = reservationDAO.getReservationById(id);
            if (existingReservation == null) {
                response.sendRedirect("viewReservation.jsp?error=" + URLEncoder.encode("Reservation not found", "UTF-8"));
                return;
            }

            // Get updated form values
            String guestName = request.getParameter("guestName");
            String roomNumber = request.getParameter("roomNumber");
            String checkIn = request.getParameter("checkIn");
            String checkOut = request.getParameter("checkOut");

            
            if (guestName == null || guestName.trim().isEmpty()
                    || roomNumber == null || roomNumber.trim().isEmpty()
                    || checkIn == null || checkIn.trim().isEmpty()
                    || checkOut == null || checkOut.trim().isEmpty()) {
                response.sendRedirect("viewReservation.jsp?error=" + URLEncoder.encode("All fields must be filled out", "UTF-8"));
                return;
            }

            
            existingReservation.setGuestName(guestName);
            existingReservation.setRoomNumber(roomNumber);
            existingReservation.setCheckIn(checkIn);
            existingReservation.setCheckOut(checkOut);

            
            reservationDAO.updateReservation(existingReservation);

            response.sendRedirect("viewReservation.jsp?success=" + URLEncoder.encode("Reservation updated successfully", "UTF-8"));

        } catch (NumberFormatException e) {
            response.sendRedirect("viewReservation.jsp?error=" + URLEncoder.encode("Invalid reservation ID", "UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewReservation.jsp?error=" + URLEncoder.encode("Update failed", "UTF-8"));
        }
    }
}
