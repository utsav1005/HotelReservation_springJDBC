package com.hotel.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession(false); 
        if (session != null) {
            session.invalidate();
        }

        
        request.setAttribute("message", "You have been logged out successfully.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
