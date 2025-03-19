<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="Login.Student" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
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
        .container {
            width: 450px;
            margin: 0 auto;
            padding: 20px;
            padding-left: 20px;
            background-color: grey;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            color: #333;
        }
        .form-group input[type="password"] {
            width: 95.5%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #333;
            color: white;
        }
        button {
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
        button:hover {
            background-color: #009bff;
            color: #333;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Change Password</h1>
    
    <form action="changePassword.jsp" method="post">
        <div class="form-group">
            <label for="currentPassword">Current Password:</label>
            <input type="password" id="currentPassword" name="currentPassword" required>
        </div>
        
        <div class="form-group">
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>
        
        <div class="form-group">
            <label for="confirmPassword">Confirm New Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <span id="passwordError" style="color: red;"></span>
        </div>
        
        <button type="submit" class="btn-submit">Change Password</button>
    </form>
</div>
<script>
    // Add event listener to the confirm password field
    document.getElementById("confirmPassword").addEventListener("input", function() {
        var newPassword = document.getElementById("newPassword").value;
        var confirmPassword = this.value; // Value of the confirm password field
        
        var errorSpan = document.getElementById("passwordError");
        
        // Check if passwords match
        if (newPassword !== confirmPassword) {
            errorSpan.textContent = "New password and confirm new password must match.";
        } else {
            errorSpan.textContent = ""; // Clear the error message if passwords match
        }
    });
</script>
</body>
</html>
<%
try {
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=latin1","root","Agrawal1683");
PreparedStatement ps = con.prepareStatement("select pass from Student where id=?");
Student student = (Student)session.getAttribute("student");
String id = student.getId();
ps.setString(1, id);
ResultSet rs = ps.executeQuery();
rs.next();
String pass = rs.getString(1);
String currentPassword = request.getParameter("currentPassword");
int uq=0;
if(pass.equals(currentPassword)){
	String newPassword = request.getParameter("newPassword");
	PreparedStatement ps2 = con.prepareStatement("Update student set pass = ? where id = ?");
	ps2.setString(1, newPassword);
	ps2.setString(2, id);
	uq = ps2.executeUpdate();
}
if (uq==1){
	out.println("<h1>Successful</h1>");
}
}catch(Exception e){
	out.println("<h1>Unsuccessful</h1>");
	System.out.println(e);
}
%>