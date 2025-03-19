<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*" %>
<%@ page import="Login.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Inventory</title>
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
    <h1>Book Inventory</h1>
    <table>
        <thead>
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Published Year</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <%
            List<Book> booksList = (List<Book>)request.getAttribute("bookslist");
          	if(booksList!= null){
          		for (Book book : booksList) {
                    out.println("<tr><td>"+ book.getBookid()+"</td>"+"<td>"+ book.getTitle()+"</td>"+"<td>"+ book.getAuthor()+"</td>"+"<td>"+ book.getPublishedYear()+"</td>"+"<td>"+ book.getDescription()+"</td></tr>");
                }
          	
          	}
			else{
				out.println("<h1>No books found</h1>");			          		
			          	}
            %>
            <!-- Add more rows for additional books -->
        </tbody>
    </table>
</div>

</body>
</html>
