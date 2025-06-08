<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"ADMIN".equalsIgnoreCase(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="styles.css" rel="stylesheet">

</head>
<body class="bg-gray-100 text-gray-800">

<div class="min-h-screen flex items-center justify-center p-4">
    <div class="bg-white rounded-xl shadow-xl w-full max-w-md p-8 space-y-6">
        <h2 class="text-2xl font-bold text-center text-blue-800">Welcome, <%= username %> (Admin)</h2>

        <div class="flex flex-col space-y-4">
            <a href="addReservation.jsp" class="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-lg text-center font-medium transition">Add Reservation</a>
            <a href="viewReservation.jsp" class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-lg text-center font-medium transition">View All Reservations</a>
            <a href="logout.jsp" class="bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded-lg text-center font-medium transition">Logout</a>
        </div>
    </div>
</div>

</body>
</html>
