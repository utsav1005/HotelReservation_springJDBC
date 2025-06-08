<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Reservation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">

</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white p-8 rounded-xl shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold text-center mb-6">Update Reservation</h2>

        <!-- Error or success messages -->
        <c:if test="${not empty error}">
            <div class="bg-red-100 text-red-700 border border-red-300 rounded p-3 mb-4">
                ${error}
            </div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="bg-green-100 text-green-700 border border-green-300 rounded p-3 mb-4">
                ${success}
            </div>
        </c:if>

        <!-- Show form only if reservation is present -->
        <c:if test="${not empty reservation}">
            <form action="UpdateReservationServlet" method="post">
                <input type="hidden" name="id" value="${reservation.id}">

                <div class="mb-4">
                    <label for="guestName" class="block text-lg font-medium mb-2">Guest Name</label>
                    <input type="text" id="guestName" name="guestName"
                           value="${reservation.guestName != null ? reservation.guestName : ''}"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" required>
                </div>

                <div class="mb-4">
                    <label for="roomNumber" class="block text-lg font-medium mb-2">Room Number</label>
                    <input type="text" id="roomNumber" name="roomNumber"
                           value="${reservation.roomNumber != null ? reservation.roomNumber : ''}"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" required>
                </div>

                <div class="mb-4">
                    <label for="checkIn" class="block text-lg font-medium mb-2">Check-In Date</label>
                    <input type="date" id="checkIn" name="checkIn"
                           value="${reservation.checkIn != null ? reservation.checkIn : ''}"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" required>
                </div>

                <div class="mb-4">
                    <label for="checkOut" class="block text-lg font-medium mb-2">Check-Out Date</label>
                    <input type="date" id="checkOut" name="checkOut"
                           value="${reservation.checkOut != null ? reservation.checkOut : ''}"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" required>
                </div>

                <button type="submit" class="w-full py-2 px-4 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition mt-4">
                    Update Reservation
                </button>
            </form>
        </c:if>

        <!-- If reservation is null or not found -->
        <c:if test="${empty reservation}">
            <div class="bg-yellow-100 text-yellow-700 border border-yellow-300 rounded p-3 mt-4">
                No reservation data to update. Please return to the reservation list.
            </div>
            <a href="viewReservation.jsp" class="w-full mt-3 inline-block text-center py-2 px-4 bg-gray-500 hover:bg-gray-600 text-white rounded-lg">
                Back to Reservation List
            </a>
        </c:if>
    </div>

</body>
</html>
