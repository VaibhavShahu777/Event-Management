<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&display=swap');
:root{
    --main-color:#3867d6;
}

*{
    font-family: 'Nunito',sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    outline: none;
    border: none;
    text-decoration: none;
    text-transform: capitalize;
    transition: .2s linear;
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
body{
    background: #222;
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
.btn a:hover{
color:#fff;
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
/* Style for the swiper slider container */
.home .home-slider .swiper-slide{
    overflow: hidden;
    border-radius: .5rem;
    height: 50rem; 
    width: 35rem; 
}



/* Style for images within swiper-slide */
.home .home-slider .swiper-slide img {
    height: 100%;
    width: 100%;
    object-fit: cover; /* Ensures the image covers the container without distortion */
    border-radius: 0.5rem; /* Optional: Matches container radius for a seamless look */
    display: block; /* Removes any extra space below the image */
}
   .heading{
    text-align: center;
    padding-bottom: 2rem;
    color: #fff;
    text-transform: uppercase;
    font-size: 4rem;
}
.heading span{
    color: var(--main-color);
    text-transform: uppercase;
}


.service .box-container{
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(27rem,1fr));
    gap:3rem;
}
.service .box-container .box{
    border-radius: .5rem;
    background: #333;
    text-align: center;
    padding: 2.5rem;
}
.service .box-container .box i{
    height: 6rem;
    width: 6rem;
    line-height: 6rem;
    border-radius: 50%;
    font-size: 2.5rem;
    background: var(--main-color);
    color: #fff;
}
.service .box-container .box h3{
    font-size: 2rem;
    color: #fff;
    padding: 1rem 0;
}
.service .box-container .box p{
    font-size: 1.4rem;
    color: #eee;
    line-height: 1.8;
}
.about .row{
display: flex;
align-items: center;
flex-wrap: wrap;
gap: 1.5rem;
}
.about .row .image{
    flex: 1 1 45rem;
    padding: 1rem;
}
.about .row .image img{
    width: 100%;
    border-radius: .5rem;
    border: 1rem solid #333;

}
.about .row .content{
    flex: 1 1 45rem;
}
.about .row .content h2{
font-size: 3.5rem;
color: #fff;
}
.about .row .content p{
    font-size: 1.5rem;
    color: #fff;
    padding: 1rem 0;
    line-height: 2.5;

}
.gallery .box-container{
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(40rem,1fr));
    gap:3rem;
}
.gallery .box-container .box{
    position: relative;
    border: 1rem solid #333;
    border-radius: .5rem;
    height: 25rem;
    cursor: pointer;
    overflow: hidden;

}
.gallery .box-container .box img{
    height: 100%;
    width: 100%;
    object-fit: cover;
}
.gallery .box-container .box:hover img{
    transform: scale(1.1);
    filter: grayscale();
}
.gallery .box-container .box .title{
    position: absolute;
    top:-10rem;
    left: 0;
    right: 0;
    background: #333;
    color: #fff;
    text-align: center;
    padding-bottom: 1rem;
    font-size: 2rem;
}
.gallery .box-container .box:hover .title{
    top:0;
}
.gallery .box-container .box .icons{
    position: absolute;
    bottom:-10rem;
    left: 0;
    right: 0;
    background: #333;
    padding-top: 1rem;
    text-align: center;
    font-size: 2rem;
}
.gallery .box-container .box:hover .icons{
    bottom: 0;
}
.gallery .box-container .box .icons a{
    font-size: 2rem;
    margin: .5rem 1rem;
    color: #fff;
}
.gallery .box-container .box .icons a:hover{
    color: var(--main-color);
}
.heading{
margin-top:10px;
}
.price .box-container{
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(25rem,1fr));
    gap:3rem;
    margin-bottom:20px;
}
.price .box-container .box{
    padding: 2rem 0;
    background: #333;
    border-radius: .5rem;
    text-align: center;

}
.price .box-container .box:hover{
   transform: scale(1.03); 
}
.price .box-container .box .title{
    background: var(--main-color);
    color: #fff;
    padding: 1.5rem 0;
    font-size: 2rem;
}
.price .box-container .box .amount{
    color: #fff;
    padding-top: 2rem;
    font-size: 4rem;
}
.price .box-container .box ul{
    list-style-type: none;
    padding: 1rem 0;

}
.price .box-container .box ul li{
    font-size: 1.5rem;
   color: #eee;
    padding: 1rem 0;
}
.price .box-container .box ul li i{
    color: var(--main-color);
    padding-right: .5rem;
}
.btn:hover{
background-color:var(--main-color);
}

 </style>
 <script>
//script.js
document.addEventListener('DOMContentLoaded', function () {
    var swiper = new Swiper(".home-slider", {
        effect: "coverflow",
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: "auto",
        coverflowEffect: {
            rotate: 0,
            stretch: 0,
            depth: 100,
            modifier: 2,
            slideShadows: true,
        },
        loop: true,
        autoplay: {
            delay: 2000,
            disableOnInteraction: false
        }
    });
});
</script>
</head>
<body>
 <header><%@ include file="Header.jsp" %></header>
 
    <section class="home" id="home">
        <div class="content">
            <h3>Its Time to celebrate! the best <span>events</span></h3>
            <button class="btn"><a href="#service">Services</a></button>
        </div>
        <div class="swiper home-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="Images/birthday1.jpg"></div>
                <div class="swiper-slide"><img src="Images/wedding1.jpg"></div>
                <div class="swiper-slide"><img src="Images/party1.jpg"></div>
                <div class="swiper-slide"><img src="Images/bday.jpg"></div>
                <div class="swiper-slide"><img src="Images/wed2.jpg"></div>
                <div class="swiper-slide"><img src="Images/wed6.jpg"></div>
                
            </div>
        </div>
    </section>
    <%if(session.getAttribute("uname")!=null) {%>
     <section class="service" id="service">
        <h1 class="heading"> Our <span>Services</span></h1>
        <div class="box-container">
            <a href="Events.jsp?event_category=corporate"><div class="box">
                <i class="fa-solid fa-handshake"></i>
                <h3>Corporate Events</h3>
                <p>Wow your guests with a unique corporate experience that aligns with your company's mission and elevates your brand.</p>
                
            </div></a>
            <a href="Events.jsp?event_category=SocialEvents"><div class="box">
                <i class="fa-solid fa-calendar-days"></i>
                <h3>Social Events</h3>
                <p>With every last detail taken care of, we're here to ensure the day you've always dreamed of will be the day you'll never forget.</p>

            </div></a>
            <a href="Events.jsp?event_category=Entertainment"><div class="box">
                <i class="fas fa-music"></i>
                <h3>Entertainment</h3>
                <p>From a show-stopping engagement celebration to an epic surprise birthday party, you dream it and we'll make it a reality.</p>
                
            </div></a>
           
        </div>
    </section>
    <%}else{ %>
        <section class="service" id="service">
        <h1 class="heading"> Our <span>Services</span></h1>
        <div class="box-container">
            <a href="loginreg.jsp"><div class="box">
                <i class="fa-solid fa-handshake"></i>
                <h3>Corporate Events</h3>
                <p>Wow your guests with a unique corporate experience that aligns with your company's mission and elevates your brand.</p>
                
            </div></a>
            <a href="loginreg.jsp"><div class="box">
                <i class="fa-solid fa-calendar-days"></i>
                <h3>Social Events</h3>
                <p>With every last detail taken care of, we're here to ensure the day you've always dreamed of will be the day you'll never forget.</p>

            </div></a>
            <a href="loginreg.jsp"><div class="box">
                <i class="fas fa-music"></i>
                <h3>Entertainment</h3>
                <p>From a show-stopping engagement celebration to an epic surprise birthday party, you dream it and we'll make it a reality.</p>
                
            </div></a>
    
          <%} %>
           
        </div>
    </section>
    <section class="about" id="about">
        <h3 class="heading"><span>About</span>Us</h3>
        <div class="row">
          <div class="image">
            <img src="Images/about.jpg">
          </div>
          <div class="content">
            <h2>We Will Give a Very Special Celebration for You!!!</h2>
            <p>We provide event management services to companies from different industries. We have a vast vendor network of Hotels and partners who help us provide the best and most cost effective event services to our clients.Our focus is to align your event objectives with modern concepts to deliver creative and engaging event experiences to your attendees.</p>
            <h2><strong>Our Event Management Philosophy</strong></h2>
            <p>To make our clients event planning processes simple by offering reliable and impactful services.The experience our clients get from working with us is always as important as the experience we deliver to the events audiences.</p>
            <a href="Contact.jsp"><button type="button" class="btn btn-primary">Contact Us</button></a>
          </div>
        </div>
       </section>
       <!-- Gallery Section -->
        <section class="gallery" id="gallery">
            <h1 class="heading">Our<span>Gallery</span></h1>
            <div class="box-container">
                <div class="box">
                    <img src="Images/wedding1.jpg">
                    <h3 class="title">Photos and Events</h3>
                    <div class="icons">
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-share"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    </div>
                    <div class="box">
                        <img src="Images/Corporatebackground.jpg">
                        <h3 class="title">Photos and Events</h3>
                        <div class="icons">
                            <a href="#" class="fas fa-heart"></a>
                            <a href="#" class="fas fa-share"></a>
                            <a href="#" class="fas fa-eye"></a>
                        </div>
                        </div>
                        <div class="box">
                            <img src="Images/bday.jpg">
                            <h3 class="title">Photos and Events</h3>
                            <div class="icons">
                                <a href="#" class="fas fa-heart"></a>
                                <a href="#" class="fas fa-share"></a>
                                <a href="#" class="fas fa-eye"></a>
                            </div>
                            </div>
                            <div class="box">
                                <img src="Images/background2.jpg">
                                <h3 class="title">Photos and Events</h3>
                                <div class="icons">
                                    <a href="#" class="fas fa-heart"></a>
                                    <a href="#" class="fas fa-share"></a>
                                    <a href="#" class="fas fa-eye"></a>
                                </div>
                                </div>
                                <div class="box">
                                    <img src="Images/party1.jpg">
                                    <h3 class="title">Photos and Events</h3>
                                    <div class="icons">
                                        <a href="#" class="fas fa-heart"></a>
                                        <a href="#" class="fas fa-share"></a>
                                        <a href="#" class="fas fa-eye"></a>
                                    </div>
                                    </div>
                                    <div class="box">
                                        <img src="Images/wed3.jpg">
                                        <h3 class="title">Photos and Events</h3>
                                        <div class="icons">
                                            <a href="#" class="fas fa-heart"></a>
                                            <a href="#" class="fas fa-share"></a>
                                            <a href="#" class="fas fa-eye"></a>
                                        </div>
                                        </div>
                                       
                
            </div>
        </section>
        <%if(session.getAttribute("uname")!=null){ %>
        <section class="price" id="price">
            <h1 class="heading">Our<span>Price</span></h1>
            <div class="box-container">
                <div class="box">
                    <h3 class="title">For Birthday</h3>
                    <h3 class="amount">&#8377 5000</h3>
                    <ul>
                        <li><i class="fas fa-check"></i>Full Services</li>
                        <li><i class="fas fa-check"></i>Decorations</li>
                        <li><i class="fas fa-check"></i>Photos & Videos</li>
                        <li><i class="fas fa-check"></i>Food and Drinks</li>
                        <li><i class="fas fa-check"></i>Entertainment</li>
                    </ul>
                    <a href="Events.jsp?event_category=SocialEvents" class="btn">Check Out</a>
                </div>
                <div class="box">
                    <h3 class="title">For Wedding</h3>
                    <h3 class="amount">&#8377 500000</h3>
                    <ul>
                        <li><i class="fas fa-check"></i>Full Services</li>
                        <li><i class="fas fa-check"></i>Decorations</li>
                        <li><i class="fas fa-check"></i>Photos & Videos</li>
                        <li><i class="fas fa-check"></i>Food and Drinks</li>
                        <li><i class="fas fa-check"></i>Entertainment</li>
                    </ul>
                    <a href="Events.jsp?event_category=socialevents" class="btn">Check Out</a>
                </div>
                <div class="box">
                    <h3 class="title">For Corporate Events</h3>
                    <h3 class="amount">&#8377 10000</h3>
                    <ul>
                        <li><i class="fas fa-check"></i>Full Services</li>
                        <li><i class="fas fa-check"></i>Decorations</li>
                        <li><i class="fas fa-check"></i>Photos & Videos</li>
                        <li><i class="fas fa-check"></i>Food and Drinks</li>
                        <li><i class="fas fa-check"></i>Entertainment</li>
                    </ul>
                    <a href="Events.jsp?event_category=corporate" class="btn">Check Out</a>
                </div>
                <div class="box">
                    <h3 class="title">For Entertainment</h3>
                    <h3 class="amount">&#8377 20000</h3>
                    <ul>
                        <li><i class="fas fa-check"></i>Full Services</li>
                        <li><i class="fas fa-check"></i>Decorations</li>
                        <li><i class="fas fa-check"></i>Photos & Videos</li>
                        <li><i class="fas fa-check"></i>Food and Drinks</li>
                        <li><i class="fas fa-check"></i>Entertainment</li>
                    </ul>
                    <a href="Events.jsp?event_category=Entertainment" class="btn">Check Out</a>
                </div>
            </div>
        </section>
        <%}else{ %>
        <section class="price" id="price">
            <h1 class="heading">Our<span>Price</span></h1>
            <div class="box-container">
                <div class="box">
                    <h3 class="title">For Birthday</h3>
                    <h3 class="amount">&#8377 5000</h3>
                    <ul>
                        <li><i class="fas fa-check"></i>Full Services</li>
                        <li><i class="fas fa-check"></i>Decorations</li>
                        <li><i class="fas fa-check"></i>Photos & Videos</li>
                        <li><i class="fas fa-check"></i>Food and Drinks</li>
                        <li><i class="fas fa-check"></i>Entertainment</li>
                    </ul>
                    <a href="loginreg.jsp" class="btn">Check Out</a>
                </div>
                <div class="box">
                    <h3 class="title">For Wedding</h3>
                    <h3 class="amount">&#8377 500000</h3>
                    <ul>
                        <li><i class="fas fa-check"></i>Full Services</li>
                        <li><i class="fas fa-check"></i>Decorations</li>
                        <li><i class="fas fa-check"></i>Photos & Videos</li>
                        <li><i class="fas fa-check"></i>Food and Drinks</li>
                        <li><i class="fas fa-check"></i>Entertainment</li>
                    </ul>
                    <a href="loginreg.jsp" class="btn">Check Out</a>
                </div>
                <div class="box">
                    <h3 class="title">For Corporate Events</h3>
                    <h3 class="amount">&#8377 10000</h3>
                    <ul>
                        <li><i class="fas fa-check"></i>Full Services</li>
                        <li><i class="fas fa-check"></i>Decorations</li>
                        <li><i class="fas fa-check"></i>Photos & Videos</li>
                        <li><i class="fas fa-check"></i>Food and Drinks</li>
                        <li><i class="fas fa-check"></i>Entertainment</li>
                    </ul>
                    <a href="loginreg.jsp" class="btn">Check Out</a>
                </div>
                <div class="box">
                    <h3 class="title">For Entertainment</h3>
                    <h3 class="amount">&#8377 20000</h3>
                    <ul>
                        <li><i class="fas fa-check"></i>Full Services</li>
                        <li><i class="fas fa-check"></i>Decorations</li>
                        <li><i class="fas fa-check"></i>Photos & Videos</li>
                        <li><i class="fas fa-check"></i>Food and Drinks</li>
                        <li><i class="fas fa-check"></i>Entertainment</li>
                    </ul>
                    <a href="loginreg.jsp" class="btn">Check Out</a>
                </div>
            </div>
        </section>
        <%} %>

        
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <%@ include file="Footer.jsp" %>
</body>

</body>
</html>