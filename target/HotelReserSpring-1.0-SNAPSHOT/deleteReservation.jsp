<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hotel.model.Reservation, com.hotel.dao.ReservationDAO" %>
<%@ page session="true" %>

<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || role == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int reservationId = Integer.parseInt(request.getParameter("id"));
    org.springframework.context.ApplicationContext context =
        new org.springframework.context.support.ClassPathXmlApplicationContext("applicationContext.xml");
    ReservationDAO reservationDAO = (ReservationDAO) context.getBean("reservationDAO");

    Reservation reservation = reservationDAO.getReservationById(reservationId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Reservation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">

</head>
<body class="bg-gray-100 text-gray-800">

<div class="max-w-2xl mx-auto mt-16 bg-white shadow-lg rounded-lg p-8">
    <h3 class="text-2xl font-bold text-center text-red-600 mb-4">Confirm Deletion</h3>
    <p class="text-center text-gray-700 mb-6">Are you sure you want to delete this reservation?</p>

    <table class="w-full text-sm border border-gray-300 mb-6">
        <tbody>
            <tr class="border-b"><th class="text-left p-2 font-semibold bg-grey-500">ID</th><td class="p-2"><%= reservation.getId() %></td></tr>
            <tr class="border-b"><th class="text-left p-2 font-semibold bg-gray-500">Guest Name</th><td class="p-2"><%= reservation.getGuestName() %></td></tr>
            <tr class="border-b"><th class="text-left p-2 font-semibold bg-gray-500">Room Number</th><td class="p-2"><%= reservation.getRoomNumber() %></td></tr>
            <tr class="border-b"><th class="text-left p-2 font-semibold bg-gray-500">Contact Number</th><td class="p-2"><%= reservation.getContactNumber() %></td></tr>
            <tr class="border-b"><th class="text-left p-2 font-semibold bg-gray-500">Check-In</th><td class="p-2"><%= reservation.getCheckIn() %></td></tr>
            <tr><th class="text-left p-2 font-semibold bg-gray-500">Check-Out</th><td class="p-2"><%= reservation.getCheckOut() %></td></tr>
        </tbody>
    </table>

    <form action="DeleteReservationServlet" method="post" class="flex justify-center gap-4">
        <input type="hidden" name="id" value="<%= reservation.getId() %>">
        <button type="submit" class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700 transition">Yes, Delete</button>
        <a href="viewReservation.jsp" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600 transition">Cancel</a>
    </form>
</div>

</body>
</html>
