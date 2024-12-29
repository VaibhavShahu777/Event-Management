<%@page import="com.MVC.Model.Student"%>
<%@page import="com.MVC.Model.Registration"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Form</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            color: #333; /* Text color */
            background-color: #fff; /* Background color */
            margin: 0;
            padding-top: 80px; /* Space for fixed header */
        }

        /* Header Styles */
        header {
            background-color: rgba(0, 0, 0, 0.7);
            color: #ffffff;
            padding: 15px 0;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s ease;
        }

        header:hover {
            background-color: rgba(0, 0, 0, 0.9); /* Fully opaque on hover */
        }

        .container2 {
            max-width: 500px;
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.8); /* Slightly more opaque background */
            backdrop-filter: blur(8px); /* Glass effect */
            -webkit-backdrop-filter: blur(8px); /* For Safari */
            border: 1px solid rgba(255, 255, 255, 0.3); /* Subtle border */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container2:hover {
            transform: scale(1.02);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }

        /* Form Styles */
        .form-group label {
            color: #333;
            font-weight: 600;
            font-size: 1.5rem;
        }

        .form-control {
            border: none;
            border-bottom: 2px solid #ddd;
            border-radius: 0;
            background: transparent;
            padding: 10px 10px 10px 35px;
            color: #333;
            font-size: 2rem;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-bottom: 2px solid #007bff;
            outline: none;
        }

        .form-control::placeholder {
            color: #999;
            font-size:2rem;
        }

        .form-control:focus::placeholder {
            color: transparent;
        }

        /* Enhanced Button Styles */
        .btn-primary {
            width: 100%;
            padding: 12px;
            background: linear-gradient(45deg, #007bff, #0056b3);
            border: none;
            border-radius: 25px;
            font-size: 16px;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #0056b3, #004080);
            transform: translateY(-2px);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .container2 {
                margin: 80px 20px;
                padding: 20px;
            }

            .form-group label,
            .form-control,
            .btn-primary {
                font-size: 0.9rem;
            }
        }

        .parent {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .edit-img img {
            margin-left: 70px;
            margin-top: 90px;
        }
        
        /* Optional: Background Overlay */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
    </style>
</head>

<% if(session.getAttribute("uname") != null) {
    Registration reg = new Registration(session);
    Student s = reg.getUserInfo();
%>
<% String status = (String)request.getAttribute("status"); %>
<body>
    <div class="parent">
        <div class="edit-img">
            <img src="Images/Edit.svg" height="600px" width="600px" alt="Edit Form">
        </div>

        <% if(request.getAttribute("status") != null) { %>
        <script>
            alert("<%= status %>");
        </script>
        <% } %>

        <header><%@ include file="Header.jsp"%></header>
        <div class="container2">
            <form action="register" method="post">
                <h2 class="text-center">Update Your Details</h2>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= s.getName() %>" placeholder="Enter your name">
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="<%= s.getPhone() %>" placeholder="Enter your phone number">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= s.getEmail() %>" placeholder="Enter your email">
                </div>
                <div class="button-group">
                    <button type="submit" class="btn btn-primary" name="submit">Update</button>
                </div>
            </form>
        </div>
    </div>
</body>
<% } %>
</html>
