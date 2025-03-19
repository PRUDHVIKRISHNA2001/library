<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import="Login.Student" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issued Book Details</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Sedan+SC&display=swap');
        body {
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
            margin: 0;
            padding: 0;
            background: url(libhome.jpg);
            background-size: cover;
            background-position: center;
            color: white;
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
        table {
            width: 100%;
            border-collapse: collapse;
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
    </style>
</head>
<body>

<div class="container">
    <h1>Issued Book Details</h1>
    <table>
        <thead>
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Published Year</th>
                <th>Return Date</th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
            	Class.forName("com.mysql.jdbc.Driver"); 
            	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=latin1","root","Agrawal1683");
            	PreparedStatement ps = con.prepareStatement("select * from issuebook where id=?");
            	Student student = (Student)session.getAttribute("student");
            	String id = student.getId();
            	ps.setString(1, id);
            	ResultSet rs=ps.executeQuery();
            	while(rs.next()){
            		int bookid = rs.getInt(1);
            		PreparedStatement ps2 = con.prepareStatement("select * from books where bookid=?");
            		ps2.setInt(1, bookid);
            		ResultSet rs2 = ps2.executeQuery();
            		rs2.next();
            		out.println("<tr><td>"+ rs2.getInt(1)+"</td>"+"<td>"+ rs2.getString(2)+"</td>"+"<td>"+ rs2.getString(3)+"</td>"+"<td>"+ rs2.getInt(4)+"</td>"+"<td>"+ rs.getString(6)+"</td></tr>");
            	}
            	}
            	catch(SQLException e){
            		out.println("<h2>No books found</h2>");
            		System.out.println(e);
            	}
            	catch(Exception ex) { 
            		out.println(ex);
            	}                
             
            %>
            
        </tbody>
    </table>
</div>

</body>
</html>
