

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Contact us</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/font-awesome.css" type="text/css"/>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script>
        $(function()
        {
          $("#header").load("header.html");  
         });
        </script>
    </head>
    <body >
              <div id="header"></div>      

           <div class="container">
            <div class="row">
                <div class="col-sm-8">
                        
                    <h3 class="mainhead3">Send us a Message</h3> 
                    </br>
                    <form action="contactsave.jsp" method="post">
                        <div class="form-group">
                            <label for="fname">Full Name:</label>
                            <input class="form-control " type="text"  required="required" name="fname" placeholder="Full Name" />
                        </div>
                        <div class="form-group">
                            <label for="pno">Phone Number:</label>
                            <input class="form-control" type="tel" required="required" name="pno"  placeholder="Phone Number"/>
                        </div> 
                        <div class="form-group">
                            <label for="email">Email Address:</label>
                            <input class="form-control" type="email" name="email"  required="required" placeholder="Email Address" />
                        </div>
                        <div class="form-group">
                            <label for="message" >Message:</label>
                            <textarea class="form-control" name="msg" required="required" placeholder="Enter Your Message"></textarea>
                        </div>
                        <div class="form-group">
                            <button class="btn" class="form-control" >
                                <span class="glyphicon glyphicon-send"></span> Send Message</button>
                        </div>
                    </form>
                </div>
                <div class="col-sm-3 col-sm-offset-1">
                    <h3 class="mainhead3">Contact Details</h3>
                    <p>Blood Bank & </br> Medical Trust,</br>C-201,Rajendra Nagar,</br>Sahibabad-201003</br></br>
                        <span class="glyphicon glyphicon-phone"></span> P:9871553898</br>
                        <span class="glyphicon glyphicon-envelope"></span> E:<a href="#">Meditrust@gmail.com</a></br>
                        <span class="glyphicon glyphicon-dashboard"></span> H:24*7</br>
                        <span class="glyphicon glyphicon-globe">W:<a href="#">www.bloodshare.com</a></p></br>
                    <ul class="social">
                        <li><a href="www.facebook.com"><img src="http://www.w3newbie.com/wp-content/uploads/facebook1.png" /></a> </li>
                        <li><a href="www.googleplus.com"><img src="http://www.w3newbie.com/wp-content/uploads/googleplus.png" /></a> </li>
                        <li><a href="www.twitter.com"><img src="http://www.w3newbie.com/wp-content/uploads/twitter1.png" /></a> </li>
                        <li><a href="www.youtube.com"><img src="http://www.w3newbie.com/wp-content/uploads/youtube1.png" /></a> </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-xm-12">
                    </br><hr></hr>
                </div>
            </div>
            <div class="row">
                <div class="col-xm-12">
                    <h3 class="text-center">Copyright &copy bloodshare.com</h3> 
                </div>
            </div>
        </div>

    </body>
</html>
