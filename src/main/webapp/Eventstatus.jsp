<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Status</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <style>
            .container1 {
                max-width: 1200px;
                margin: auto;
                margin-top: 70px;
                padding: 0 15px;
            }

            .table-wrapper {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            .table-title {
                padding-bottom: 15px;
                background: #35475e;
                color: #fff;
                padding: 16px;
                border-radius: 8px 8px 0 0;
                margin-bottom: 20px;
            }

            .table-title h2 {
                margin: 0;
                font-size: 28px;
            }

            table.table {
                margin-bottom: 0;
            }

            table.table thead th {
                font-size:2rem;
                background-color: #333;
                color: #fff;
                border-bottom: 2px solid #dee2e6;
                font-weight: bold;
                text-align: center;
                padding: 15px;
            }

            table.table tbody tr {
                transition: background-color 0.3s ease;
            }

            table.table tbody tr:hover {
                background-color: #f1f1f1;
            }

            table.table tbody td {
               font-size:1.8rem;
                border-top: 1px solid #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }

            table.table img {
                 font-size:1.8rem;
                border-radius: 8px;
            }

            table.table td a {
                font-weight: bold;
                color: #007bff;
                text-decoration: none;
                outline: none;
            }

            table.table td a:hover {
                color: #0056b3;
            }

            table.table td a.edit {
                color: #ffc107;
            }

            table.table td a.delete {
                color: #dc3545;
            }

            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }

            .btn-danger {
                background-color: #dc3545;
                border: none;
                border-radius: 5px;
                color: #fff;
                padding: 8px 16px;
                font-size: 14px;
                cursor: pointer;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
            }

            .btn-danger:hover {
                background-color: #c82333;
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            }

            .btn {
                border-radius: 5px;
                font-size: 14px;
            }
            .container1 {
            max-width: 1200px;
            margin: auto;
            margin-top: 70px;
            padding: 0 15px;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .table-title {
            padding-bottom: 15px;
            background: #35475e;
            color: #fff;
            padding: 16px;
            border-radius: 8px 8px 0 0;
            margin-bottom: 20px;
        }

        .table-title h2 {
            margin: 0;
            font-size: 28px;
            font-weight: 600;
        }

        .table-title h2 b {
            color: #ff6f61; /* Accent color for emphasis */
        }

        .table-title {
            border-bottom: 2px solid #ff6f61; /* Accent color for bottom border */
        }

        .col-sm-4 {
            display: flex;
            align-items: center;
            justify-content: center; /* Center content horizontally */
        }

        .col-sm-4 h2 {
            margin: 0;
            font-size: 28px;
            font-weight: 600;
            color: #fff; /* Text color */
        }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="container1">
                <%@include file="Header.jsp"%>
            </div>
        </div>
        <% if (session.getAttribute("uname") != null) {%>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4">
                                <h2>Manage <b>Events</b></h2>
                            </div>
                        </div>
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
                                ArrayList<Dproduct> ar = s1.geteventstatus();
                                Iterator<Dproduct> itr = ar.iterator();
                                while (itr.hasNext()) {
                                    Dproduct s = itr.next();
                            %> 
                            <tr>
                                <td><img src="Images/<%=s.getP_image()%>" width="100" height="100" class="img-thumbnail"></td>
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
                                        <button type="submit" class="btn btn-danger" name="cancelevent">Cancel</button>
                                    </form>
                                </td>
                                <%} else if (s.getStatus().equals("booked")) {%>
                                <td style="color:green">    
                                   Booked   <i class="fa-regular fa-thumbs-up"></i>
                                </td>
                                <%} else if (s.getStatus().equals("cancelled")) {%>
                                <td style="color:red">
                                   Cancelled   <i class="fa-regular fa-thumbs-down"></i>
                                </td>
                                <%}%>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>        
        </div>
        <%}%>
    </body>
</html>