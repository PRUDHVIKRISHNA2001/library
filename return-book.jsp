<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,height=device-height">
    <title>Return Book</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Sedan+SC&display=swap');
        body {
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
            margin: 0;
            padding: 55px;
            background-color: skyblue;
            color: #333;
            background: url(libhome.jpg) no-repeat;
            background-size: cover;
            background-position: center;
        }
        .container {
            max-width: 650px;
            margin: 20px auto;
            padding: 19px;
            background-color: grey;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height: 96vh;
            max-height: 300px;
            color: white;
            margin-top: 10%;
        }
        h1 {
            text-align: center;
            color: whitesmoke;
            margin-top: 0px;
        }
        form {
            display: grid;
            grid-gap: 10.5px;
        }
        label {
            font-weight: bold;
        }
        input[type="number"],
        input[type='date'],
        input[type="text"],
        textarea {
            width: 100%;
            height: 75%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: #333;
            color: white;
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
        }
        textarea {
            resize: vertical;
            min-height: 100px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
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
    <h1>Return Book</h1>
    <form action="return-book.jsp" method="post">
        <label for="BookId">Book ID:</label>
        <input type="number" id="bid" name="bid" required>
        
        <label for="StudentId">Student ID</label>
        <input type="text" id="sid" name="sid" required>

        <input type="submit" value="Return Book">
    </form>
</div>
<%
try {

Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=latin1","root","Agrawal1683");
PreparedStatement ps = con.prepareStatement("DELETE FROM issuebook WHERE bookid = ? and id = ?");
ps.setInt(1, Integer.valueOf(request.getParameter("bid")));
ps.setString(2, request.getParameter("sid"));
int uq = ps.executeUpdate();
	if (uq==0){
		out.println("<h2>Unsuccessful!</h2>");
	}
	else{
		PreparedStatement ps2 = con.prepareStatement("UPDATE books SET quantity = quantity + 1 WHERE bookid = ?");
		ps2.setInt(1, Integer.valueOf(request.getParameter("bid")));
		ps2.executeUpdate();
		out.println("<h2>Successfully Inserted.</h2>");
}
}catch(java.lang.NumberFormatException ne){
		
}
catch(SQLException e){
	out.println("<h2>Unsuccessful!</h2>");
}
%>
</body>
</html>
