<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<htmky6il lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Sedan+SC&display=swap');
        body {
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            background: url(libhome.jpg) no-repeat;
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background-color: grey;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            display: flex;
            justify-content: space-between;
            width: 600px;
            height: auto;
        }
        .login-container form {
            width: 45%;
        }
        .login-container h2 {
            margin-top: 0px;
            margin-bottom: 20px;
            font-size: 35px;
            color: white;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
            background-color: #333;
            color: white;
            
        }
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
            transition: background-color 0.3s ease;
        }
        .login-container input[type="submit"]:hover {
            background-color: #009bff;
            color: #333;
        }
    </style>
</head>
<body>

<div class="login-container">
    <form action="AdminControllerServlet" method="post">
        <h2>Admin Login</h2>
        <input type="text" name="admin_username" placeholder="Username" required>
        <input type="password" name="admin_password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>
    <form action="StudentControllerServlet" method="post">
        <h2>Student Login</h2>
        <input type="text" name="student_id" placeholder="Student ID" required>
        <input type="password" name="student_password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>
</div>

</body>
</html>
