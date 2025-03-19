<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="Login.Student" %>
<%@ page import="java.io.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Sedan+SC&display=swap');
        body {
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
            margin-top: 70px;
            background: url(libhome.jpg);
            background-size: cover;
            background-position: center;
            color: white;
            padding-top: 60px;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: grey;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: white;
            margin-bottom: 30px;
            background-color: #333;
            border-radius: 5px;
            padding: 4px;
        }
        .profile-info {
            background-color: #333;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: white;
        }
        .profile-info:hover{
            background-color: grey;
            color: #333;
        }
        .profile-info h2 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 24px;
        }
        .profile-info p {
            margin: 0;
            font-size: 16px;
            line-height: 1.6;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: grey;
            font-weight: bold;
            text-align: left;
            color: #333;
        }
        tr:hover {
            background-color: rgb(199, 192, 192);
            color: #333;
        }
        input[type="submit"] {
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
        input[type="submit"]:hover {
            background-color: #009bff;
            color: #333;
        }
    </style>
</head>



<body>
<% 
Student student = (Student)session.getAttribute("student");
String name = student.getName();
String id = student.getId();
Long number = student.getNumber();
%>
<div class="container">
    <h1>User Profile</h1>
    
    <div class="profile-info personal-info">
        <h2>Personal Information</h2>
        <p><strong>Name:</strong> <%= name %></p>
        <p><strong>ID</strong> <%= id %></p>
        <p><strong>Number:</strong> <%= number %></p>
    </div>
    <form action='changePassword.jsp'><input type='submit' value='Change Password'/></form>
    
</div>

</body>
</html>
