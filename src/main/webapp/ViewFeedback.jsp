<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Feedback"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Table</title>
<style>
    table {
        border-spacing: 0;
        border-collapse: collapse;
        width: 100%;
        opacity: 0; /* Start hidden */
        animation: fadeIn 2s forwards; /* Apply fade-in animation */
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    th, td {
        padding: 15px;
        font-size: 2rem;
        font-weight: bold;
        text-align: left;
        border: 1px solid #ddd;
    }
    th {
        background-color: #343a40;
        color: #fff;
        text-align: center;
    }
    tr:nth-child(odd) {
        background-color: #f9f9f9;
    }
    tr:nth-child(even) {
        background-color: #fff;
    }
    tr:hover {
        background-color: #e9ecef;
    }
    h1 {
        color: #212529;
        text-align: center;
        margin-bottom: 20px;
    }
    .container {
        margin-top: 50px;
    }
</style>

</head>
<body>
<header><%@ include file="Header.jsp" %></header>
<% 
    Registration reg = new Registration(session);
    ArrayList<Feedback> al = reg.DisplayFeedback();
    Iterator<Feedback> itr = al.iterator();
%>

<div class="container">
    <h1>Feedback Details</h1>
    <table class="table table-stripped">
        <tr>
            <th>Event Id</th>
            <th>Event Message</th>
            <th>Event Rating</th>
            <th>Date</th>
        </tr>
        <% while(itr.hasNext()) {
            Feedback f = itr.next(); %>
            <tr>
                <td><%=f.getId() %></td>
                <td><%=f.getMessage() %></td>
                <td><%=f.getRating() %></td>
                <td><%=f.getDate() %></td>
            </tr>
        <% } %>
    </table>
</div>

</body>
</html>
