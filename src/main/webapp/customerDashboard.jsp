<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"CUSTOMER".equalsIgnoreCase(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 text-gray-800">

<!-- Container -->
<div class="max-w-xl mx-auto mt-16 bg-white shadow-lg rounded-lg p-8">
    <h2 class="text-2xl font-bold text-center mb-6">Welcome, <%= username %> <span class="text-sm font-medium text-gray-600">(Customer)</span></h2>

    <div class="flex flex-col space-y-4">
        <a href="addReservation.jsp"
           class="text-center bg-green-600 text-white py-2 px-4 rounded hover:bg-green-700 transition">
            Add Reservation
        </a>
        <a href="viewReservation.jsp"
           class="text-center bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700 transition">
            View My Reservations
        </a>
        <a href="logout.jsp"
           class="text-center bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700 transition">
            Logout
        </a>
    </div>
</div>

</body>
</html>
