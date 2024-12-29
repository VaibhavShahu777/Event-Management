<!DOCTYPE html>
<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="com.MVC.Model.Registration"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book an Event</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<style>
    /* General Container Styles */
    .container3 {
        padding: 40px;
        max-width: 900px;
        margin: 0 auto;
        margin-top: 50px;
    }

    /* Status Message */
    .status-message {
        font-size: 2em;
        color: green;
        margin-top: 20px;
        margin-bottom: 30px;
        font-weight: bold;
    }
    .status-message a{
    color:blue;
    }

    /* Form Heading */
    .form-heading {
        font-size: 3em;
        color: #333;
        margin-bottom: 30px;
        font-weight: 700;
        text-transform: uppercase;
        border-bottom: 3px solid #007bff;
        padding-bottom: 15px;
        display: inline-block;
    }

    /* Custom Card */
    .custom-card {
        background: #ffffff;
        border-radius: 15px;
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        padding: 30px;
        margin-bottom: 30px;
        position: relative;
        overflow: hidden;
    }

    /* Card Header Gradient */
    .custom-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 15px;
        background: linear-gradient(90deg, #007bff, #00d2d3);
        border-radius: 15px 15px 0 0;
        z-index: 1;
    }

    /* Card Content */
    .card-content {
        position: relative;
        z-index: 2;
    }

    /* Card Title */
    .card-title {
        font-size: 2em;
        color: #333;
        margin-bottom: 20px;
        font-weight: 600;
        border-bottom: 1px solid #f1f1f1;
        padding-bottom: 10px;
    }

    /* Form Labels */
    .form-label {
        font-weight: 600;
        color: #555;
        margin-bottom: 8px;
        font-size: 1.8em;
    }

   
    .form-control1 {
    margin-left:90px;
    border-radius: 10px;
        border: 1px solid #ddd;
        padding: 15px;
        font-size: 1.5em;
        transition: border-color 0.3s;
    }
    .form-control2 {
    margin-left:20px;
    border-radius: 10px;
        border: 1px solid #ddd;
        padding: 15px;
        font-size: 1.5em;
        transition: border-color 0.3s;
    }
    .form-control3 {
    margin-left:90px;
    border-radius: 10px;
        border: 1px solid #ddd;
        padding: 15px;
        font-size: 1.5em;
        transition: border-color 0.3s;
    }
    .form-control4 {
    margin-left:76px;
    border-radius: 10px;
        border: 1px solid #ddd;
        padding: 15px;
        font-size: 1.5em;
        transition: border-color 0.3s;
    }
    .form-control5 {
    margin-left:47px;
    border-radius: 10px;
        border: 1px solid #ddd;
        padding: 15px;
        font-size: 1.5em;
        transition: border-color 0.3s;
    }
    .form-control6 {
    margin-left:54px;
    border-radius: 10px;
        border: 1px solid #ddd;
        padding: 15px;
        font-size: 1.5em;
        transition: border-color 0.3s;
    }
    .form-control7 {
    margin-left:38px;
    border-radius: 10px;
        border: 1px solid #ddd;
        padding: 15px;
        font-size: 1.5em;
        transition: border-color 0.3s;
    }
    

    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
    }

    /* Custom Button */
    .btn-custom {
        background-color: #007bff;
        color: #fff;
        padding: 15px 30px;
        border: none;
        border-radius: 10px;
        font-size: 1.2em;
        font-weight: 600;
        text-transform: uppercase;
        transition: background-color 0.3s, transform 0.2s, box-shadow 0.3s;
    }

    .btn-custom:hover {
        background-color: #0056b3;
        transform: scale(1.05);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    /* Additional Styling for Form Fields */
    .mb-3 {
        margin-bottom: 2rem;
    }

    input[readonly] {
        background-color: #f9f9f9;
        cursor: not-allowed;
    }

    input::placeholder {
        color: #aaa;
    }
    .image img{
    margin-left:400px;
    margin-top:-700px;
    }
</style>
</head>
<body>
<%@include file="Header.jsp"%>
<div class="container3">
    <div class="text-center">
        <% if (request.getAttribute("status") != null) {%>
        <h1 class="status-message"> <%= request.getAttribute("status")%></h1>
        <%}%>
        <br>
        <% if (session.getAttribute("uname") != null) {
            Registration reg = new Registration(session);
            Dproduct s = reg.getEventFormInfo(request.getParameter("event_id")); %>
        <h2 class="form-heading">Book an Event</h2>
        <form action='addtocart' method='POST' id="bookevent">
            <div class="custom-card">
                <div class="card-content">
                    <h3 class="card-title">Event Booking Form</h3>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="name" class="form-label">Name:</label>
                            <input type="text" class="form-control1" id="name" name="name" value="<%=session.getAttribute("uname")%>" readonly>
                            <br><br>
                        </div>
                        <div class="col-md-4">
                            <label for="pno" class="form-label">Phone Number:</label>
                            <input type="text" class="form-control2" id="pno" name="pno" value="<%=session.getAttribute("phone")%>" readonly>
                            <br><br>
                        </div>
                        <div class="col-md-4">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control3" id="email" name="email" value="<%=session.getAttribute("email")%>" readonly>
                            <br><br>
                        </div>
                   
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="address" class="form-label">Address:</label>
                            <input type="text" class="form-control4" id="address" name="address" placeholder="Enter your address">
                            <br><br>
                        </div>
                        <div class="col-md-4">
                            <label for="ename" class="form-label">Event Name:</label>
                            <input type="text" class="form-control5" id="ename" name="ename" value="<%=s.getP_name()%>" readonly>
                            <br><br>
                        </div>
                        <div class="col-md-4">
                            <label for="ecost" class="form-label">Event Cost:</label>
                            <input type="text" class="form-control6" id="ecost" name="ecost" value="<%=s.getP_cost()%>" readonly>
                            <br><br>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="edate" class="form-label">Date of Event:</label>
                            <input type="date" class="form-control7" id="edate" name="edate" value="" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
                        </div>
                    </div>
                    <input type="hidden" name="event_id" value="<%=request.getParameter("event_id")%>"> 
                    <button type="submit" class="btn btn-custom" name="bookevent">Book Now</button>
                </div>
            </div>
            <div class="image">
            <img src="Images/bookevent.svg" height="700px" width="500px">
            </div>
        </form>
        <%}%>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>

</body>
</html>
