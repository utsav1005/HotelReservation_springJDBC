package com.hotel.servlet;

import com.hotel.dao.ReservationDAO;
import com.hotel.model.Reservation;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AddReservationServlet extends HttpServlet {

    private ReservationDAO reservationDAO;

    @Override
    public void init() {
        
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        reservationDAO = (ReservationDAO) context.getBean("reservationDAO");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            request.setAttribute("error", "You must be logged in to add a reservation.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        
        String guestName = request.getParameter("guestName");
        String roomNumber = request.getParameter("roomNumber");
        String contactNumber = request.getParameter("contactNumber");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        
        
        

       
        Reservation reservation = new Reservation();
        reservation.setUserName(username);  
        reservation.setGuestName(guestName);
        reservation.setRoomNumber(roomNumber);
        reservation.setContactNumber(contactNumber);
        reservation.setCheckIn(checkIn);
        reservation.setCheckOut(checkOut);

       
        reservationDAO.addReservation(reservation);

        
        request.setAttribute("message", "Reservation\n" +
"        // Inform the user and forward to the view reservations page\n" +
"       added successfully!");
        request.getRequestDispatcher("viewReservation.jsp").forward(request, response);
    }
}
