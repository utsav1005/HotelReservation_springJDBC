<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">

</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen text-gray-800">

    <div class="bg-white p-8 rounded-xl shadow-lg w-full max-w-md">
        <h3 class="text-2xl font-bold text-center mb-6">Create an Account</h3>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="bg-red-100 text-red-700 border border-red-300 rounded p-3 mb-4">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="RegisterServlet" method="post">
            <div class="mb-4">
                <label for="username" class="block text-lg font-medium mb-2">Username</label>
                <input type="text" id="username" name="username" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" required>
            </div>

            <div class="mb-4">
                <label for="password" class="block text-lg font-medium mb-2">Password</label>
                <input type="password" id="password" name="password" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" required>
            </div>

            <div class="mb-4">
                <label for="confirmPassword" class="block text-lg font-medium mb-2">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" required>
            </div>

            <div class="mb-4">
                <label for="role" class="block text-lg font-medium mb-2">Role</label>
                <select id="role" name="role" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" required>
                    <option value="" disabled selected>Select role</option>
                    <option value="ADMIN">Admin</option>
                    <option value="CUSTOMER">Customer</option>
                </select>
            </div>

            <button type="submit" class="w-full py-2 px-4 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition">Register</button>
        </form>

        <p class="mt-3 text-center text-lg">Already have an account? <a href="login.jsp" class="text-blue-600 hover:underline">Login</a></p>
    </div>

</body>
</html>
