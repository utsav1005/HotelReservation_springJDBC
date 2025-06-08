<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="com.hotel.model.Reservation" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || role == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">

   
</head>
<body class="bg-gray-100 text-gray-800">

<nav class="bg-blue-800 text-white px-6 py-4 flex justify-between items-center">
    <h1 class="text-xl font-semibold">Add Reservation</h1>
    <div>
        Welcome, <strong><%= username %></strong>
        <a href="LogoutServlet" class="ml-4 px-3 py-1 border border-white rounded hover:bg-white hover:text-blue-800 transition">
            Logout
        </a>
    </div>
</nav>

<!-- Form Container -->
<div class="max-w-2xl mx-auto mt-10 bg-white p-8 rounded shadow">
    <h2 class="text-2xl font-bold mb-6 text-center">Add a New Reservation</h2>
    <form action="AddReservationServlet" method="post" class="space-y-5">
        <div>
            <label for="guestName" class="block mb-1 font-medium">Guest Name</label>
            <input type="text" name="guestName" id="guestName" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
        <div>
            <label for="roomNumber" class="block mb-1 font-medium">Room Number</label>
            <input type="number" name="roomNumber" id="roomNumber" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
        <div>
            <label for="contactNumber" class="block mb-1 font-medium">Contact Number</label>
            <input type="text" name="contactNumber" id="contactNumber" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
        <div>
            <label for="checkIn" class="block mb-1 font-medium">Check-In Date</label>
            <input type="date" name="checkIn" id="checkIn" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
        <div>
            <label for="checkOut" class="block mb-1 font-medium">Check-Out Date</label>
            <input type="date" name="checkOut" id="checkOut" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <div class="flex justify-between mt-6">
            <button type="submit"
                    class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition">
                Add Reservation
            </button>
            <a href="<%= (role.equalsIgnoreCase("admin") ? "adminDashboard.jsp" : "customerDashboard.jsp") %>"
               class="bg-gray-500 text-white px-6 py-2 rounded hover:bg-gray-600 transition">
                Back to Dashboard
            </a>
        </div>
    </form>
</div>

</body>


</html>
