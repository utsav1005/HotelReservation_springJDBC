<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hotel Reservation System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">

</head>
<body class="bg-gray-100 text-gray-800">

<div class="flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 rounded-xl shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold text-center mb-6">Welcome to the Hotel Reservation System</h2>

        <div class="flex flex-col gap-4">
            <a href="login.jsp" class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded text-center transition">Login</a>
            <a href="register.jsp" class="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded text-center transition">Register</a>
        </div>
    </div>
</div>

</body>
</html>
