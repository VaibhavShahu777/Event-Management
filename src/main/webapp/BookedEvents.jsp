<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Manage Events</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            font-size: 1rem; /* Base font size */
        }
        .container-xl {
            max-width: 1200px;
            margin: auto;
        }
        .table-wrapper {
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .table-title {        
            padding-bottom: 15px;
            background: #007bff;
            color: #fff;
            padding: 16px 30px;
            border-radius: 8px 8px 0 0;
            position: relative;
        }
        .table-title h2 {
            margin: 0;
            font-size: 28px;
        }
        table.table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }
        table.table th, table.table td {
            padding: 15px 20px; /* Increased padding */
            text-align: left;
            border: 1px solid #e0e0e0;
            font-size: 1.8rem; /* Increased font size */
        }
        table.table th {
            background-color: #333; /* Match title color */
            color: #fff; /* White text for contrast */
            font-size: 2rem; /* Increased font size for headers */
            font-weight: bold; /* Bold font for headers */
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2; /* Lighter background for odd rows */
        }
        table.table-striped.table-hover tbody tr:hover {
            background-color: #e0e7ff; /* Change hover color */
        }
        table.table td img {
            border-radius: 5px;
        }
        table.table td a {
            font-weight: bold;
            color: #007bff;
            text-decoration: none;
        }
        table.table td a:hover {
            text-decoration: underline;
        }
        .btn {
            border-radius: 5px;
            padding: 8px 12px;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
        .btn:hover {
            filter: brightness(90%);
        }
    </style>
</head>
<body>
    <%@include file="Header.jsp"%>
    <% if (session.getAttribute("uname") != null) {%>
    <div class="container-xl">
        <div class="table-wrapper">
            <div class="table-title">
                <h2>Manage <b>Events</b></h2>
            </div>  
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Cost</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Booked Date</th>
                        <th>Event Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Registration s1 = new Registration(session);
                        ArrayList<Dproduct> ar = s1.geteventstatusAdmin();
                        Iterator<Dproduct> itr = ar.iterator();
                        while (itr.hasNext()) {
                            Dproduct s = itr.next();
                    %> 
                    <tr>
                        <td><img src="Images/<%=s.getP_image()%>" width="100px" height="100px"></td>
                        <td><%=s.getP_name()%></td>
                        <td><%=s.getP_cost()%></td>
                        <td><%=s.getPhone()%></td>
                        <td><%=s.getEmail()%></td>
                        <td><%=s.getDate()%></td>
                        <td><%=s.getEventdate()%></td>
                        <%if (s.getStatus().equals("pending")) {%>
                        <td style="color:blue">
                            <form action="addtocart" method="post">
                                <input type="hidden" name="event_id" value="<%=s.getP_id()%>"/>
                                <button type="submit" class="btn btn-success" name="acceptevent">Accept</button>
                                <button type="submit" class="btn btn-danger" style="margin-top: 6px;" name="admincancelevent">Cancel</button>
                            </form>
                        </td>
                        <%} else if (s.getStatus().equals("booked")) {%>
                        <td style="color:green">
                            <%=s.getStatus()%> <i class="fa-regular fa-thumbs-up"></i>
                        </td>
                        <%} else if (s.getStatus().equals("cancelled")) {%>
                        <td style="color:red">
                            <%=s.getStatus()%> <i class="fa-regular fa-thumbs-down"></i>
                        </td>
                        <%}%>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </div>        
    <%}%>
    <%@include file="Footer.jsp"%>
</body>
</html>
