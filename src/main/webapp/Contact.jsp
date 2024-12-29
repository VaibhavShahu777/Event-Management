<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style1.css">
<!-- Fontawesome icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<style>

@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap');
:root{
    --main-color:#3867d6;
}
*{
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}
.contact-section{
margin-top:50px;
}
.video{
border-radius: 50%;
}
body{
    font-family: 'Open Sans', sans-serif;
    line-height: 1.5;
}
.contact-bg{
    height: 40vh;
    background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url(image/contact-bg.jpg);
    background-position: 50% 100%;
    background-repeat: no-repeat;
    background-attachment: fixed;
    text-align: center;
    color: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.contact-bg h3{
    font-size: 1.3rem;
    font-weight: 400;
}
.contact-bg h2{
    font-size: 3rem;
    text-transform: uppercase;
    padding: 0.4rem 0;
    letter-spacing: 4px;
}
.line div{
    margin: 0 0.2rem;
}
.line div:nth-child(1),
.line div:nth-child(3){
    height: 3px;
    width: 70px;
    background: var(--main-color);
    border-radius: 5px;
}
.line{
    display: flex;
    align-items: center;
}
.line div:nth-child(2){
    width: 10px;
    height: 10px;
    background: var(--main-color);
    border-radius: 50%;
}
.text{
    font-weight: 300;
    opacity: 0.9;
}
.contact-bg .text{
    margin: 1.6rem 0;
}
.contact-body{
    max-width: 1320px;
    margin: 0 auto;
    padding: 0 1rem;
}
.contact-info{
    margin: 2rem 0;
    text-align: center;
    padding: 2rem 0;
}
.contact-info span{
    display: block;
}
.contact-info div{
    margin: 0.8rem 0;
    padding: 1rem;
}
.contact-info span .fas{
    font-size: 2rem;
    padding-bottom: 0.9rem;
    color: var(--main-color);
}
.contact-info div span:nth-child(2){
    font-weight: 500;
    font-size: 1.1rem;
}
.contact-info .text{
    padding-top: 0.4rem;
}
/* Form Container Styling */
form {
    width: 100%;
    max-width: 500px;
    margin: 20px auto;
    padding: 30px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    position: relative;
}

/* Floating Label Effect */
.form-group {
    position: relative;
    margin-bottom: 20px;
}

.form-control {
    width: 100%;
    padding: 10px 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background: #f9f9f9;
    font-size: 20px;
    transition: border-color 0.3s, padding-top 0.3s, font-size 0.3s;
}

.form-control:focus {
    border-color: #007bff;
    outline: none;
}



/* Floating Label Styling */
label {
    position: absolute;
    top: 10%;
    left: 10px;
    font-size: 20px;
    color: #999;
    pointer-events: none;
    transition: top 0.3s, font-size 0.3s, color 0.3s;
}

/* Submit Button Styling */
.send-btn {
    display: inline-block;
    width: 100%;
    padding: 12px;
    background: #007bff;
    color: #fff;
    border: none;
    border-radius: 8px;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s, transform 0.3s;
}

.send-btn:hover {
    background: #0056b3;
    transform: translateY(-2px);
}

/* Responsive Design */
@media (max-width: 600px) {
    form {
        padding: 20px;
    }

    .form-control {
        padding: 12px 8px;
        font-size: 14px;
    }

    .send-btn {
        font-size: 16px;
        padding: 10px;
    }
}


/* Responsive Design for Smaller Screens */
@media (max-width: 600px) {
    form {
        padding: 15px;
    }

    .form-control {
        padding: 12px;
        font-size: 14px;
    }

    .send-btn {
        font-size: 16px;
        padding: 10px;
    }
}

.contact-form > div video{
    width: 100%;
    border:none;
    text-decoration:none;
}
.contact-form > div{
    margin: 0 auto;
    text-align: center;
}
.contact-footer{
    padding: 2rem 0;
    background: #000;
}
.contact-footer h3{
    font-size: 1.3rem;
    color: #fff;
    margin-bottom: 1rem;
    text-align: center;
}
.social-links{
    display: flex;
    justify-content: center;
}
.social-links a{
    text-decoration: none;
    width: 40px;
    height: 40px;
    color: #fff;
    border: 2px solid #fff;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0.4rem;
    transition: all 0.4s ease;
}
.social-links a:hover{
    color: var(--main-color);
    border-color: var(--main-color);
}

@media screen and (min-width: 768px){
    .contact-bg .text{
        width: 70%;
        margin-left: auto;
        margin-right: auto;
    }
    .contact-info{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
}

@media screen and (min-width: 992px){
    .contact-bg .text{
        width: 50%;
    }
    .contact-form{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        align-items: center;
    }
}

@media screen and (min-width: 1200px){
    .contact-info{
        grid-template-columns: repeat(4, 1fr);
    }
}
.contact-form{
margin-top:-40px;
}





</style>
</head>
<% String status = (String)request.getAttribute("status"); %>
 <% if(request.getAttribute("status") != null) { %>
        <script>
            alert("<%= status %>");
        </script>
        <% } %>
<body>
 <header><%@ include file="Header.jsp" %></header>
<section class="contact-section">
    <div class="contact-bg">
        <h3>Get in Touch with Us</h3>
        <h2>Contact Us</h2>
        <div class="line">
            <div></div>
            <div></div>
            <div></div>
        </div>
        <p class="text"></p>
    </div>

    <div class="contact-body">
        <div class="contact-info">
            <div>
                <span><i class="fas fa-mobile-alt"></i></span>
                <span>Phone No.</span>
                <span class="text">91182829191</span>
            </div>
            <div>
                <span><i class="fas fa-envelope-open"></i></span>
                <span>E-mail</span>
                <span class="text">eventsphere.com</span>
            </div>
            <div>
                <span><i class="fas fa-map-marker-alt"></i></span>
                <span>Address</span>
                <span class="text">Vijaynagar, Bangalore</span>
            </div>
            <div>
                <span><i class="fas fa-clock"></i></span>
                <span>Opening Hours</span>
                <span class="text">Monday - Friday (9:00 AM to 5:00 PM)</span>
            </div>
        </div>

        <div class="contact-form">
           <form action="Contact" method="post">
    <div class="form-group">
        <input type="text" class="form-control" placeholder="Enter Your Name" name="name"  value=<%=session.getAttribute("uname") %> required>
       
    </div>
    <div class="form-group">
        <input type="text" class="form-control" placeholder="Enter the Subject" name="subject" required>
       
    </div>
    <div class="form-group">
        <input type="email" class="form-control" placeholder="Enter your Mail id" name="email" value=<%=session.getAttribute("email") %> required>
       
    </div>
    <div class="form-group">
        <textarea rows="5" class="form-control" placeholder="Enter the message" name="message" required></textarea>
        
    </div>
    <input type="submit" class="send-btn" name="Contact" value="Send Message">
</form>

            <div class="video">
                <video autoplay muted loop height="500px" width="900px">
                    <source src="Images/contactform.mp4" type="video/mp4">
                </video>
            </div>
        </div>
    </div>

    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31104.155133226614!2d77.51214284615104!3d12.970610890038193!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae3dd95efc3ae7%3A0xc90db791aedd9aad!2sVijayanagar%2C%20Bengaluru%2C%20Karnataka!5e0!3m2!1sen!2sin!4v1726163237544!5m2!1sen!2sin" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

    <div class="contact-footer">
        <h3>Follow Us</h3>
        <div class="social-links">
            <a href="#" class="fab fa-facebook-f"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="#" class="fab fa-instagram"></a>
            <a href="#" class="fab fa-linkedin"></a>
            <a href="#" class="fab fa-youtube"></a>
        </div>
    </div>
</section>

</body>
</html>
