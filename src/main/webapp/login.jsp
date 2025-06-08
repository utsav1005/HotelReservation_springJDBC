<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">

</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen text-gray-800">

<div class="bg-white p-8 rounded-xl shadow-lg w-full max-w-md">
    <h2 class="text-2xl font-bold text-center mb-6">Login</h2>

    <form action="LoginServlet" method="post" class="space-y-4">
        <div>
            <label for="username" class="block font-medium mb-1">Username</label>
            <input type="text" id="username" name="username" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <div>
            <label for="password" class="block font-medium mb-1">Password</label>
            <input type="password" id="password" name="password" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <div class="text-center">
            <button type="submit"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded transition">
                Login
            </button>
        </div>
    </form>

    <p class="mt-4 text-center text-sm">
        Don't have an account?
        <a href="register.jsp" class="text-blue-600 hover:underline">Register here</a>
    </p>

    <c:if test="${not empty errorMessage}">
        <div class="mt-4 bg-red-100 text-red-700 border border-red-300 rounded px-4 py-2 text-center">
            ${errorMessage}
        </div>
    </c:if>
</div>

</body>
</html>
