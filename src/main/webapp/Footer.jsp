<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event Sphere</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        overflow-x: hidden;
    }
    .parent1 {
        background-color: #f4e7d3;
        padding: 20px 0;
         margin-right: -15px;
      
    }
    .parent {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        padding: 20px;
        margin: 20px auto;
        width: 80%;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .child {
        flex: 1;
        margin: 0 20px;
    }
    h5 {
        color: #2c3e50;
        font-size: 20px;
        margin-bottom: 15px;
        border-bottom: 3px solid #2c3e50;
        padding-bottom: 8px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    #p1 {
        margin-top: 0;
        padding-left: 10px;
        line-height: 1.8;
        font-size: 16px;
    }
    hr {
        border: 0;
        border-top: 1px solid #d1d1d1;
        margin: 40px 0;
    }
    #img1 {
        border-radius: 50%;
        border: 4px solid #2c3e50;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s ease;
    }
    #img1:hover {
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
    }
    .footer-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 20px;
        background-color: black; 
        border-radius: 8px;
        margin: 20px auto;
        width: 80%;
    }
    .footer-container img {
        margin-right: 20px;
    }
    .footer-links {
        display: flex;
        justify-content: space-evenly;
        flex-direction: column;
    }
    .footer-links a {
        color: #8b4513;
        text-decoration: none;
        margin-bottom: 10px;
        font-size: 16px;
        transition: color 0.3s ease;
    }
    .footer-links a:hover {
        color: #DEB887;
        text-decoration: underline;
    }

   
   footer {
    background-color: #222;
    backdrop-filter: blur(10px); /* Apply blur effect */
    color: #fff; 
    padding: 20px 0;
    text-align: center;
    margin-top: -10px;
    margin-right: -15px;
    height: 100px;
}

    footer a {
        color: #fff; 
        text-decoration: none;
        margin: 0 15px;
        font-size: 14px;
        transition: color 0.3s ease;
    }
    footer a:hover {
    
        color: blue; 
        text-decoration: none;
    }
    footer p {
        margin: 2px 0;
        font-size: 14px;
    }
</style>
</head>
<body>


<footer>
    <p>&copy; 2024 Event Sphere. All rights reserved.</p>
    <%if(session.getAttribute("uname")!=null){ %>
    <a href="Privacy.jsp">Privacy Policy</a> |
     <a href="Events.jsp?event_category=socialevents">Services</a> |
     <a href="Contact.jsp">Contact Us</a> 
    <%}else{ %> 
    <a href="Contact.jsp">Contact Us</a> |
    <a href="Events.jsp?event_category=socialevents">Services</a> |
     <a href="loginreg.jsp">Privacy Policy</a> 
    <%} %>
</footer>
</body>
</html>