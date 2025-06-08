package com.hotel.servlet;

import com.hotel.dao.UserDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        userDAO = (UserDAO) context.getBean("userDAO");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (userDAO.validateUser(username, password)) {
            String role = userDAO.getRoleByUsername(username);

            // Create session and store username and role
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            // Redirect based on role
            if ("ADMIN".equalsIgnoreCase(role)) {
                response.sendRedirect("adminDashboard.jsp");
            } else if ("CUSTOMER".equalsIgnoreCase(role)) {
                response.sendRedirect("customerDashboard.jsp");
            } else {
                session.invalidate();
                request.setAttribute("error", "Invalid role assigned to user.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
