<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event Management</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&display=swap');
:root{
    --main-color:#3867d6;
}

html{
    font-size: 62.5%;
    overflow-x: hidden;
    scroll-padding-top: 7rem;
    scroll-behavior: smooth;
}
html::-webkit-scrollbar{
    width: 1rem;
}
html::-webkit-scrollbar-track{
    background: #444;
}
html::-webkit-scrollbar-thumb{
   background: var(--main-color);
   border-radius: 5rem;
}

.section{
    padding: 2rem 9%;
}
.home .content {
    text-align: center;
    padding-top: 6rem;
    margin: 2rem auto;
    max-width: 70rem;

}
.home .content h3{
    color: #fff;
    font-size: 4.5rem;
    text-transform: uppercase;
}
.home .content span{
    color: var(--main-color);
}
.btn{
    margin-top: 1rem;
    display: inline-block;
    padding: .8rem 3rem;
    font-size: 1.7rem;
    border-radius: .5rem;
    background: #666;
    color: #fff;
    cursor: pointer;
    font-weight: 600;
}
.btn a{
    text-decoration: none;
    color: #fff;
}

.header{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 10000;
    background: #333;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 1.5rem 9%;
}
.header .logo{
    font-weight: bolder;
    color: #fff;
    font-size: 2.5rem;
}
.header .logo span{
    color: var(--main-color);
}
.header .navbar a{
font-size: 1.5rem;
color: #fff;
margin-right: 2rem;

}
.header .navbar a:hover{
    color: var(--main-color);
}
#menu-bars{
    font-size: 3rem;
    color: #fff;
    cursor: pointer;
    display: none;
}
@media(max-width:991px){
    html{
        font-size: 55%;
    } 
    .header{
        padding: 1.5rem 2rem;
    }
}
@media(max-width:786px){
    #menu-bars{
        display: initial;
    } 
    .header .navbar{
        position: absolute;
        top: 0;left: 0;
        right: 0;
        border-top: 1rem solid #222;
        background: #333;
    }
    .header .navbar a{
        display: flex;
        background: #222;
        border-radius: .5rem;
        padding: 1.3rem;
        margin: 1.3rem;
        font-size: 2.5rem;
    }
}
@media(max-width:450px){
    html{
        font-size: 50%;
    } 
    
}
.btn{
    margin-top: 1rem;
    display: inline-block;
    padding: .8rem 3rem;
    font-size: 1.7rem;
    border-radius: .5rem;
    background: #666;
    color: #fff;
    cursor: pointer;
    font-weight: 600;
}
 a{
    text-decoration: none;
    color: #fff;
}
a:hover{
color:var(--main-color);
}
.btn{
color:#fff;
background-color:blue;
}

</style>
</head>
<body>
<header class="header">
        <a href="#" class="logo">
            <span>Event</span>Sphere
        </a>
        <nav class="navbar">
         <%if(session.getAttribute("uname")!=null){ %>
            <a href="Home1.jsp">Home</a>
            <%}else{ %>
             <a href="Home.jsp">Home</a>
             <%} %>
            <%if(session.getAttribute("uname")!=null){ %>
          <a href="EditForm.jsp">Edit</a>
           <a href="Contact.jsp">Contact</a>
           
            <a href="Eventstatus.jsp">My Events</a>
             <% if(session.getAttribute("id").equals("1")){ %>
             <a href="BookedEvents.jsp">Booked Events</a>
              <a href="addDelEvent.jsp">Add/Delete</a>
             <a href="ViewFeedback.jsp">View Customer Feedback</a>
             <%}else{ %>
             <a href="Feedback.jsp">Give Feedback</a>
             
            <%} %>
             <a href="register?logout=yes"><button class="btn">Logout</button></a>
            
            <%}else{ %>
           
            <a href="loginreg.jsp"><button class="btn">Login/Signup</button></a>
            
           
            <%} %>
        </nav>
        <div id="menu-bars" class="fas fa-bars"></div>
    </header>
</body>
</html>
