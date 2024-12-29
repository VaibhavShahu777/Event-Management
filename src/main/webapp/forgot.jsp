<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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

        .input-group {
            position: relative;
        }

        .input-group .input-group-text {
            background: transparent;
            border: none;
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #555;
        }

        .form-control {
            border: none;
            border-bottom: 2px solid #ddd;
            border-radius: 0;
            background: transparent;
            padding: 10px 10px 10px 35px;
            color: #333;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-bottom: 2px solid #007bff;
            outline: none;
        }

        .form-control::placeholder {
            color: #999;
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

        /* Error Message Styles */
        .error {
            color: #e74c3c;
            font-weight: 500;
            font-size: 0.9rem;
            margin-top: 5px;
        }

        /* Success Message Styles */
        #msg {
            background: rgba(212, 237, 218, 0.9); /* Light green with transparency */
            color: #155724;
            border: 1px solid #c3e6cb;
            width: 100%;
            font-weight: 600;
            font-size: 18px;
            padding: 15px;
            border-radius: 8px;
            margin: 20px 0;
            text-align: center;
            animation: fadeIn 0.5s ease-in-out;
        }

        /* Animation for Success Message */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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

        .parent {
            display: flex;
            align-items: center; /* Center items vertically */
            justify-content: center; /* Center items horizontally */
            gap: 20px; /* Space between items */
            padding: 20px; /* Add padding around the container */
        }

        .image img {
          margin-left:70px;
          margin-top:90px;  
        }
        .text-center{
        font-weight:bold;
        
        }
        
    </style>
</head>

<% String status = (String)request.getAttribute("status"); %>
<body>
<% if(request.getAttribute("status") != null) { %>
<script>
    alert("<%= status %>");
</script>
<% } %>
    <header> <%@include file="Header.jsp"%></header>
    <div class="parent">
        <div class="image">
            <img src="Images/forgot1.jpg" height="500px" width="600px" alt="Forgot Password">
        </div>
       <div class="container2">
    <form method="post" id="forgot" action="register">
        <h2 class="text-center">Forgot Password</h2>
        <div class="form-group">
        <i class="fas fa-envelope"></i>
            <label for="email">Email Address</label>
            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
        </div>
        <div class="form-group">
        <i class="fas fa-lock"></i>
            <label for="pw">Password</label>
            <input type="password" class="form-control" id="pw" placeholder="Enter Password" name="pw">
        </div>
        <div class="form-group">
        <i class="fas fa-lock"></i>
            <label for="cpw">Confirm Password</label>
            <input type="password" class="form-control" id="cpw" placeholder="Re-enter Password" name="cpw">
        </div>
        <button type="submit" class="btn btn-primary" name="forgotPass">Submit</button>
    </form>
</div>

    </div>

    <script>
        jQuery.validator.addMethod("checkemail", function(value, element) {
            return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
        }, "Please enter a valid email format (e.g., abc@gmail.com)");

        jQuery(document).ready(function($) {
            $("#forgot").validate({
                rules: {
                    email: {
                        required: true,
                        checkemail: true
                    },
                    pw: {
                        required: true,
                        minlength: 6
                    },
                    cpw: {
                        required: true,
                        minlength: 6,
                        equalTo: "#pw"
                    },
                },
                messages: {
                    email: {
                        required: "Please enter your email.",
                    },
                    pw: {
                        required: "Please enter your password.",
                        minlength: "Your password must be at least 6 characters long."
                    },
                    cpw: {
                        required: "Please confirm your password.",
                        minlength: "Your password must be at least 6 characters long.",
                        equalTo: "Passwords do not match."
                    },
                }
            });
        });
    </script>
</body>
</html>
