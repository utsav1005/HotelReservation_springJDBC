package com.hotel.servlet;

import com.hotel.dao.ReservationDAO;
import com.hotel.model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import java.io.IOException;
import java.util.List;

public class ViewReservationServlet extends HttpServlet {

    private ReservationDAO reservationDAO;

    @Override
    public void init() throws ServletException {
        
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        reservationDAO = (ReservationDAO) context.getBean("reservationDAO");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");

        if (username == null) {
           
            response.sendRedirect("login.jsp");
            return;
        }

      
        List<Reservation> reservations;
        if ("admin".equals(role)) {
            
            reservations = reservationDAO.getAllReservations();
        } else {
           
            reservations = reservationDAO.getReservationsByUser(username);
        }

        
        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("viewReservation.jsp").forward(request, response);
    }
}
