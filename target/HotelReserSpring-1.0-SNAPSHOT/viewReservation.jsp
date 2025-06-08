<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.hotel.model.Reservation, com.hotel.dao.ReservationDAO" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (username == null || role == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    org.springframework.context.ApplicationContext context =
        new org.springframework.context.support.ClassPathXmlApplicationContext("applicationContext.xml");
    ReservationDAO reservationDAO = (ReservationDAO) context.getBean("reservationDAO");
    List<Reservation> reservations = "ADMIN".equalsIgnoreCase(role)
        ? reservationDAO.getAllReservations()
        : reservationDAO.getReservationsByUser(username);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reservations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">

</head>
<body class="bg-gray-100">

    <div class="container mx-auto px-4 py-8">
        <h2 class="text-3xl font-bold text-center mb-6">Reservation List</h2>

       
        <!-- Reservation Table -->
        <div class="overflow-x-auto bg-white shadow-lg rounded-lg">
            <table class="table-auto w-full border-collapse">
                <thead class="bg-blue-600 text-white">
                    <tr>
                        <th class="py-2 px-4 border-b">ID</th>
                        <th class="py-2 px-4 border-b">Guest</th>
                        <th class="py-2 px-4 border-b">Room</th>
                        <th class="py-2 px-4 border-b">Contact</th>
                        <th class="py-2 px-4 border-b">Check-In</th>
                        <th class="py-2 px-4 border-b">Check-Out</th>
                        <th class="py-2 px-4 border-b">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Reservation r : reservations) { %>
                        <tr class="border-b hover:bg-gray-50">
                            <td class="py-2 px-4"><%= r.getId() %></td>
                            <td class="py-2 px-4"><%= r.getGuestName() %></td>
                            <td class="py-2 px-4"><%= r.getRoomNumber() %></td>
                            <td class="py-2 px-4"><%= r.getContactNumber() %></td>
                            <td class="py-2 px-4"><%= r.getCheckIn() %></td>
                            <td class="py-2 px-4"><%= r.getCheckOut() %></td>
                            <td class="py-2 px-4">
                                <a href="UpdateReservationServlet?id=<%= r.getId() %>" class="text-yellow-500 hover:text-yellow-600 font-semibold">Update</a> |
                                <a href="deleteReservation.jsp?id=<%= r.getId() %>" class="text-red-500 hover:text-red-600 font-semibold" onclick="return confirm('Are you sure you want to delete this reservation?')">Delete</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Back Button -->
        <a href="<%= "ADMIN".equals(role) ? "adminDashboard.jsp" : "customerDashboard.jsp" %>" class="mt-6 inline-block px-6 py-3 bg-gray-700 hover:bg-gray-800 text-white font-semibold rounded-lg">
            Back to Dashboard
        </a>
    </div>

</body>
</html>
