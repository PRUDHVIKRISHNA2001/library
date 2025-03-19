<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Sedan+SC&display=swap');
        body {
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
            margin: 0;
            padding: 55px;
            background-color: #f2f2f2;
            background: url(adminhome.png) no-repeat;
            background-size: cover;
            background-position: center;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: grey;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height: 70vh;
        }
        h1 {
            text-align: center;
            color: white;
            margin-bottom: 30px;
            margin-top: 10px;
        }
        form {
            display: grid;
            grid-gap: 20px;
        }
        label {
            font-weight: bold;
            color: white;
        }
        input[type="text"],
        input[type="password"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: #333;
            color: white;
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            font-family: "Sedan SC", serif;
            font-size: 16px;
            font-style: normal;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #009bff;
            color: #333;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Student Registration</h1>
    <form action="register-student.jsp" method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="mobile">Mobile Number:</label>
        <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" required>

        <input type="submit" value="Register">
    </form>
</div>
<%
try {
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=latin1","root","Agrawal1683");
PreparedStatement ps = con.prepareStatement("insert into Student values(?,?,?,?)");
ps.setString(1, request.getParameter("id"));
ps.setString(2, request.getParameter("name"));
ps.setString(3, request.getParameter("password"));
ps.setLong(4, Long.valueOf(request.getParameter("mobile")));

int uq = ps.executeUpdate();
if (uq==1){
	System.out.println("Successfully Inserted");
}
}
catch(SQLException e){
	out.println("Unsuccessful!");
}
catch(NumberFormatException ne){
	
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
