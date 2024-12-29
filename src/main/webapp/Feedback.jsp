<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Form</title>
<style>
    /* Basic reset and styling */
    body {
        margin: 0;
        font-family: 'Roboto', sans-serif;
        background-color: #fff;
        color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction:row;
        height: 100vh;
        overflow: hidden;
    }

    .container {
        display: flex;
        flex-direction: row;
        align-items: center;
        width: 90%;
        max-width: 1000px;
        margin-left:600px;
      
    }

   

    main {
        background: black;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        width: 100%;
        margin-top:50px;
        max-width: 700px;
          
    }

    .card {
        color: #fff;
    }

    .card h3 {
        margin-top: 0;
        font-size: 24px;
        font-weight: 700;
        border-bottom: 2px solid #555;
        padding-bottom: 10px;
        text-align: center;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 10px;
        font-weight: 500;
        font-size: 16px;
        color: #ccc;
    }

    .emoji-buttons {
        display: flex;
        gap: 15px;
        justify-content: center;
        flex-wrap: wrap;
    }

    .emoji-buttons label {
        display: flex;
        flex-direction: column;
        align-items: center;
        cursor: pointer;
        transition: transform 0.3s, background-color 0.3s, box-shadow 0.3s;
        padding: 10px;
        border-radius: 10px;
        background-color: #444;
        text-align: center;
        color: #ccc;
    }

    .emoji-buttons input[type="radio"] {
        display: none;
    }

    .emoji-buttons h1 {
        font-size: 32px;
        margin: 0;
        color: #ccc;
    }

    .emoji-buttons span {
        margin-top: 5px;
        font-size: 14px;
        color: #fff;
    }

    .emoji-buttons label:hover {
        background-color: black;
        transform: scale(1.1);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .emoji-buttons input[type="radio"]:checked + h1 {
        color: #007BFF;
    }

    textarea {
        width: 90%;
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #666;
        font-size: 16px;
        resize: vertical;
        background-color: #444;
        color: #fff;
        box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    textarea:focus {
        border-color: #007BFF;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
        outline: none;
    }

    input[type="checkbox"] {
        margin-right: 8px;
    }
    

    a {
        color: #007BFF;
        text-decoration: none;
        font-weight: 500;
    }

    a:hover {
        text-decoration: underline;
    }

    button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 12px 20px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        margin-right: 10px;
        transition: background-color 0.3s, box-shadow 0.3s;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    button:hover {
        background-color: #0056b3;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    button[type="reset"] {
        background-color: #6c757d;
    }

    button[type="reset"]:hover {
        background-color: #5a6268;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }
    .status-message{
    color:#fff;
    background-color:green;
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

    <main>
    
        <div class="card">
            <h3>Give Feedback</h3>
            <form action="register" method="post">
                <div class="form-group">
                    <label for="rating">What do you think of the issue search experience with us?</label>
                    <div class="emoji-buttons">
                        <label>
                            <input type="radio" name="rating" value="amazing" />
                            <h1>&#128525;</h1>
                            <span>Amazing</span>
                        </label>
                        <label>
                            <input type="radio" name="rating" value="good" />
                            <h1>&#128522;</h1>
                            <span>Good</span>
                        </label>
                        <label>
                            <input type="radio" name="rating" value="okay" />
                            <h1>&#128528;</h1>
                            <span>Okay</span>
                        </label>
                        <label>
                            <input type="radio" name="rating" value="bad" />
                            <h1>&#128546;</h1>
                            <span>Bad</span>
                        </label>
                        <label>
                            <input type="radio" name="rating" value="terrible" />
                            <h1>&#128534;</h1>
                            <span>Terrible</span>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="reasons">What are the main reasons for your rating?</label>
                    <textarea  id="reasons" cols="30" rows="10" name="message"></textarea>
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" name="privacy-policy" />
                        I may be contacted about this feedback.
                        <a href="Privacy.jsp">Privacy Policy</a>
                    </label>
                </div>
                

                <div class="form-group">
                    <button type="submit" name="feedbacksubmit">Submit</button>
                    <button type="reset">Cancel</button>
                </div>
              
            </form>
        </div>
    </main>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const emojiLabels = document.querySelectorAll('.emoji-buttons label');

        emojiLabels.forEach(label => {
            label.addEventListener('click', function() {
                // Remove 'selected' class from all labels
                emojiLabels.forEach(l => l.classList.remove('selected'));
                
                // Add 'selected' class to the clicked label
                this.classList.add('selected');
            });
        });
    });
</script>

<style>
  
    .emoji-buttons label.selected {
        background-color: 	#007BFF;
        color: black;
    }
</style>

</body>
</html>
