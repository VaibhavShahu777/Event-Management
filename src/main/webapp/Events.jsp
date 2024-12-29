<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Black Theme</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
/* General body styling */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: white; /* Light gray background for contrast */
}

/* Header styling */
header {
    background-color: #333;
    color: #fff;
    margin-bottom:60px;
    padding: 15px 0;
    text-align: center;
}

header h1 {
    margin: 0;
}

/* Card container styling */
.parent {
    display: flex;
    flex-direction: column; /* Stack cards vertically in a column */
    align-items: center; /* Center align cards */
    padding: 20px;
}

/* Card styling */
.card {
    background-color: #fff;
    border: 2px solid #ddd;
    border-radius: 30px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin: 10px;
    width: 80%; /* Adjust width for better alignment in column */
    max-width: 600px; /* Optional: Limit maximum width */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.card img {
    width: 100%;
    height: auto;
       border-radius: 30px;
    border-bottom: 1px solid #ddd;
}

.card-content {
    padding: 15px;
}

.card-content h2 {
    margin-top: 0;
    font-size: 2.5rem;
    font-weight: bold;
    color: #0044cc;
}

.card-content .price {
    color: #2c3e50;
    font-size: 2rem;
    font-weight: bold;
    margin: 10px 0;
}

.card-content p {
    margin: 0;
    font-size: 2rem;
    color: #555;
}

/* Button styling */
.btn {
    background-color: #3498db;
    border: none;
    color: #fff;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 1em;
    margin: 10px 0;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #2980b9;
}

.btn.btn-primary {
    background-color: #0044cc;
}

.btn.btn-primary:hover {
    background-color: #0033a0;
}

/* Media Queries for Responsive Design */
@media (max-width: 768px) {
    .card {
        width: 90%; /* Adjust width on tablets */
    }
}

@media (max-width: 480px) {
    .card {
        width: 95%; /* Adjust width on mobile */
    }
}


    </style>
</head>
<body>
 <header><%@ include file="Header.jsp" %></header>
    <%
        Registration r = new Registration(session);
        ArrayList<Dproduct> al = r.getEventInfo(request.getParameter("event_category"));
        Iterator<Dproduct> it = al.iterator();
        while (it.hasNext()) {
            Dproduct s = it.next(); %>
            <div class="parent">
                <div class="card">
                    <img src="Images/<%=s.getP_image() %>" alt="<%=s.getP_name() %>">
                    <div class="card-content">
                        <h2><%=s.getP_name() %></h2>
                        <p class="price">&#8377 <%=s.getP_cost() %></p>
                        <p><%=s.getP_details() %></p>
                        <% if(session.getAttribute("uname") != null) { %>
                            <a href="EventBooking.jsp?event_id=<%=s.getP_id()%>" class="but">
                                <button class="btn btn-primary">Book Now</button>
                            </a>
                        <% } else {
                            session.setAttribute("logoutredirect", "Events.jsp?event_category=" + request.getParameter("event_category")); %>
                            <a href="loginreg.jsp" class="but">
                                <button class="btn">Book Now</button>
                            </a>
                        <% } %>
                    </div>
                </div>
            </div>
        <% } %>
</body>
</html>
