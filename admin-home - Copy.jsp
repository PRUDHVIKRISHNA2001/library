<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Sedan+SC&display=swap');
        body {
            font-family: "Sedan SC", serif;
            font-size: 20px;
            font-style: normal;
            margin: 0;
            padding: 0;
            background-color: skyblue;
            color: #333;
            background: url(adminhome.png) no-repeat;
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
            color: white;
            background-color: #333;
            border-radius: 5px 10px 20px 30px;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-left-radius: 5px;
            padding: 30px;
            font-family: "Sedan SC", serif;
            font-size: 40px;
            font-style: normal;
        }
        .options {
            display: flexbox;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            grid-gap: 20px;
        }
        .option {
            background-color: grey;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            border-color: #333;
        }
        .option:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            background-color: #333;
            color: white;
        }
        .option a {
            font-family: "Sedan SC", serif;
            font-size: 30px;
            font-style: normal;
            text-decoration: none;
            color: white;
            margin-top: 0px;
        }
        .option i {
            font-size: 36px;
            margin-bottom: 10px;
            color: #007bff;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Welcome, Admin!</h1>
    <div class="options">
        <div class="option">
            <a href="add-book.jsp">Add Book</a>
        </div>

        <div class="option">
            <a href="issue-book.jsp">Issue Book</a>
        </div>
    
        <div class="option">
            <a href="issue-details.jsp">Issued Book Details</a>
        </div>
    
        <div class="option">
            <a href="return-book.jsp">Return Book</a>
        </div>
       
        <div class="option">
            <a href="register-student.jsp">Register Student</a>
        </div>
        
    </div>
</div>

<!-- Add Font Awesome CDN for icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

</body>
</html>
