<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="Login.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Login.Student" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Library</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Sedan+SC&display=swap');
        body {
            font-family: "Sedan SC", serif;
            font-size: 15px;
            font-style: normal;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            color: #333;
            background: url(libhome.jpg) no-repeat;
            background-size: cover;
            background-position: center;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            border-radius: 5px 10px 20px 30px;
            border-top-left-radius: 20px;
            border-bottom-right-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            padding: 15px;
            background-color: grey;
        }
        h2{
            border-radius: 5px 10px 20px 30px;
            border-top-left-radius: 20px;
            border-bottom-right-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            padding: 15px;
            background-color: grey;
        }
        .search-form {
            margin-bottom: 20px;
            text-align: center;
        }
        .search-input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #333;
            color: white;
			font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
            width: 83%;
        }
        ::placeholder{
        	color: #333;
        }
        .search-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            font-size: 22px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .search-btn:hover {
            background-color: #009bff;
            color: #333;
        }
        .book-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .book-item {
            background-color: grey;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .book-item h2 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 20px;
        }
        .book-item p {
            margin: 0;
            font-size: 16px;
        }
        html{
            font-size: 62.5%;
            overflow-x: hidden;
            scroll-padding-top: 9rem;
            scroll-behavior: smooth;
            scrollbar-color: skyblue;
        }
        html::-webkit-scrollbar{
            width: .8rem;
        }

        html::-webkit-scrollbar-track{
            background: black;
        }

        html::-webkit-scrollbar-thumb{
            background: black;
            border-radius: 5rem;
        }
        /* Updated styles for sidebar */
		.sidebar {
		    position: fixed;
		    left: 0;
		    top: 0;
		    height: 100%;
		    width: 200px;
		    background-color: #007bff; /* Primary color */
		    padding: 20px;
		    box-sizing: border-box;
		    color: #fff;
		    font-size: 18px; /* Increase font size */
		    overflow-y: auto; /* Enable scrolling if content exceeds height */
		}
		
		.sidebar h3 {
		    margin-top: 0;
		    margin-bottom: 20px; /* Add space below heading */
		    font-size: 24px; /* Increase font size */
		    text-transform: uppercase; /* Uppercase heading text */
		}
		
		.sidebar a {
		    display: block;
		    color: #fff;
		    text-decoration: none;
		    margin-bottom: 10px;
		    transition: 0.3s ease; /* Add transition effect */
		}
		
		.sidebar a:hover {
		    text-decoration: underline;
		    color: #ffd700; /* Change color on hover */
		}       
    </style>
</head>
<body>
<div class="sidebar">
    <h3>Menu</h3>
    <a href="show-profile.jsp">Show Profile</a>
    <a href="booksIssuedDetails.jsp">Books Issued</a>
</div>
<%
Student student = (Student)session.getAttribute("student");
String name = student.getName();

%>

<div class="container">
    <h1>Welcome, <%= name%>!</h1>
    <div class="search-form">
        <form action="student-home.jsp" method="post">
            <input type="text" name="query" class="search-input" placeholder="Search for a book...">
            <button type="submit" class="search-btn">Search</button>
        </form>
    </div>
    
    <h2>Some Books from Library</h2>
    <ul class="book-list">
        <!-- Example book items -->
        <li class="book-item">
            <h2>The Catcher in the Rye</h2>
            <p>Author: J.D. Salinger</p>
            <p>Published: 1951</p>
            <p>Description:  A novel about teenage angst</p>
        </li>
        <li class="book-item">
            <h2>The Great Gatsby</h2>
            <p>Author: F. Scott Fitzgerald</p>
            <p>Published: 1925</p>
            <p>Description:  A novel of the Jazz Age</p>
        </li>
        <li class="book-item">
            <h2>War and Peace</h2>
            <p>Author: Leo Tolstoy</p>
            <p>Published: 1869</p>
            <p>Description: A historical novel set during the Napoleonic Wars</p>
        </li>
    </ul>
</div>
<%

try {
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=latin1","root","Agrawal1683");
PreparedStatement ps = con.prepareStatement("select * from books where title like concat('%',?,'%')");
String title = request.getParameter("query");
ps.setString(1, title);
ResultSet rs=ps.executeQuery();
List<Book> books = new ArrayList<>();

while(rs.next()){
	Book book = new Book();
	book.setBookid(rs.getInt(1));
	book.setTitle(rs.getString(2));
	book.setAuthor(rs.getString(3));
	book.setPublishedYear(rs.getInt(4));
	book.setDescription(rs.getString(5));
	books.add(book);
}
if (books.isEmpty()) {
    //out.println("<h1>No books found!</h1>");
} else {
    request.setAttribute("bookslist", books);
    RequestDispatcher rd = request.getRequestDispatcher("display-book.jsp");
    rd.forward(request, response);
}}
catch(SQLException e){
	out.println("No books found");
}
catch(Exception ex) { 
	out.println(ex);
}


%>
</body>
</html>
