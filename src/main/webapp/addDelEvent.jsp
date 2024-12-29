<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Event Management</title>
    <style type="text/css">
        body {
            background: #f0f4f8; /* Soft background color */
            color: #333; /* Dark text for readability */
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
        }
        .hero {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            background: #fff; /* White background for the form */
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 90%; /* Responsive width */
            max-width: 800px; /* Maximum width */
        }
        .form-box {
            width: 100%;
            padding: 20px;
            position: relative;
        }
        .button-box {
            width: 220px;
            margin: 20px auto;
            position: relative;
            background: #fff;
            border-radius: 30px;
            overflow: hidden;
        }
        .toggle-btn {
            padding: 10px 30px;
            cursor: pointer;
            background: transparent;
            border: none;
            outline: none;
            color: black;
            font-size: 16px;
            font-weight: bolder;
            transition: color 0.3s;
        }
        .toggle-btn:hover {
            color: black;
        }
        #btn {
            position: absolute;
            top: 0;
            left: 0;
            width: 50%;
            height: 100%;
            background: linear-gradient(to right, #0044cc, #66ccff); /* Blue gradient */
            border-radius: 30px;
            transition: left 0.5s ease;
            z-index: 0;
        }
        .form-box form {
            display: none; /* Hide all forms initially */
        }
        .form-box form.active {
            display: block; /* Show active form */
        }
        .group {
            margin-bottom: 20px; /* Increased spacing */
        }
        .label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #333; /* Darker color for contrast */
            font-weight: bold;
        }
        .input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .input:focus {
            border-color: #0044cc;
            box-shadow: 0 0 8px rgba(0, 68, 204, 0.3); /* Enhanced shadow on focus */
            outline: none;
        }
        .button {
            width: 100%;
            padding: 10px;
            background: #0044cc;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .button:hover {
            background: #ffad06; 
        }
        .image {
            margin-right: 20px; 
        }
        img {
            max-width: 100%; /* Responsive image */
            height: auto; /* Maintain aspect ratio */
        }
    </style>
</head>
<% String status = (String)request.getAttribute("status"); %>
<% if (request.getAttribute("status") != null) { %>
<script>
    alert("<%= status %>");
</script>
<% } %>
<body>
   <header><%@include file="Header.jsp"%></header>
    <div class="hero">
        <div class="image">
            <img src="https://neuroprofiler.com/wp-content/uploads/2022/09/undraw_Add_tasks_re_s5yj-1210x660.png" alt="Event Image">
        </div>
        <div class="form-box">
            <div class="button-box">
                <div id="btn"></div>
                <button type="button" class="toggle-btn" onclick="toggleForm('add')">Add</button>
                <button type="button" class="toggle-btn" onclick="toggleForm('delete')">Delete</button>
            </div>
            <form id="addForm" class="active" method="POST" action="register">
                <div class="group">
                    <label for="image" class="label">Event Image Path</label>
                    <input id="image" type="text" name="image" class="input" placeholder="Give Image Path" required>
                </div>
                <div class="group">
                    <label for="name" class="label">Event Name</label>
                    <input id="name" type="text" name="name" class="input" placeholder="Enter Event Name" required>
                </div>
                <div class="group">
                    <label for="cost" class="label">Event Cost</label>
                    <input id="cost" type="number" name="cost" class="input" placeholder="Enter Event Cost" required>
                </div>
                <div class="group">
                    <label for="details" class="label">Event Details</label>
                    <input id="details" type="text" name="details" class="input" placeholder="Enter Event Details" required>
                </div>
                <div class="group">
                    <label for="category" class="label">Event Category</label>
                    <input id="category" type="text" name="category" class="input" placeholder="Enter Event Category" required>
                </div>
                <div class="group">
                    <input type="submit" class="button" name="addevent" value="Add Event">
                </div>
            </form>
            <form id="deleteForm" method="POST" action="register">
                <div class="group">
                    <label for="ename" class="label">Event Name</label>
                    <input id="ename" type="text" name="ename" class="input" placeholder="Enter Event Name" required>
                </div>
                <div class="group">
                    <input type="submit" class="button" name="delevent" value="Delete Event">
                </div>
            </form>
        </div>
    </div>
    <script>
        function toggleForm(formType) {
            document.getElementById('addForm').classList.toggle('active', formType === 'add');
            document.getElementById('deleteForm').classList.toggle('active', formType === 'delete');
            document.getElementById('btn').style.left = formType === 'add' ? '0' : '110px'; /* Adjust the indicator position */
        }
    </script>
</body>
</html>
