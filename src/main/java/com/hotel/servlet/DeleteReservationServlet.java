package com.hotel.servlet;

import com.hotel.dao.ReservationDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class DeleteReservationServlet extends HttpServlet {

    private ReservationDAO reservationDAO;

    @Override
    public void init() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        reservationDAO = (ReservationDAO) context.getBean("reservationDAO");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        deleteReservation(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        deleteReservation(request, response);
    }

    private void deleteReservation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        HttpSession session = request.getSession(false);

        try {
            int id = Integer.parseInt(idStr);
            reservationDAO.deleteReservation(id);
            request.setAttribute("message", "Reservation deleted successfully.");
        } catch (Exception e) {
            request.setAttribute("error", "Failed to delete reservation.");
        }

        String role = (session != null) ? (String) session.getAttribute("role") : null;

        if ("ADMIN".equalsIgnoreCase(role)) {
            request.getRequestDispatcher("viewReservation.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("customerDashboard.jsp").forward(request, response);
        }
    }
}
