
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Need Blood</title>
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
                <div class="col-sm-12">
                    <h2 class="mainhead2"><span class="glyphicon glyphicon-heart"></span> Need Blood To Save Life</h2>
                    <hr/>
                </div>
        </div>
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li ><a href="donar_reg.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Donar Registration</a></li>
                          <li class="active"><a href="needblood.jsp"><i class="glyphicon glyphicon-shopping-cart"></i> Need Blood</a></li>
                            <li><a href="search_donar.jsp"><i class="glyphicon glyphicon-search"></i> Search Donar</a></li>
                    </ol>
                </div>
            </div>
              <div class="row">
                  <div class="col-sm-5 col-sm-offset-3">
                    <p class="lead_form "><i class="fa fa-envelope" aria-hidden="true"></i> <b>Need Blood To Save Life</b></p>
                    <div id="form" class="col-sm-12">
                        <form method="post" action="needbloodsave.jsp"> </br>
                            <div class="form-group">
                                <label for="pname">Patient Name</label>
                                <input class="form-control " type="text"  required="required" name="pname" placeholder="Patient Name" />
                            </div>
                          <div class="form-group">
                                <label for="p_gender">Gender</label>
                                <select name="p_gender" class="form-control">
                                    <option value="-1">--Select--</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div> 
                            <div class="form-group">
                                <label for="p_blood">Required Blood Group</label>
                                <select name="p_blood" class="form-control">
                                    <option value="-1">Select Blood</option>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                            </div>
                              <div class="form-group">
                                <label for="unit_of_blood">Need Unit Of Blood</label>
                                <input class="form-control" type="text" required="required" name="unit_of_blood"  placeholder="Insert No Of Unit"/>
                            </div>
                               <div class="form-group">
                                <label for="h_address">Hospital Name & Address</label>
                                <textarea name="h_address" class="form-control" placeholder="Insert Full Address"></textarea>
                                </div>
                               <div class="form-group">
                                <label for="dr_name">Doctor Name</label>
                                <input type="text" name="dr_name" class="form-control" placeholder=" Doctor Name">
                                </div>
                                <div class="form-group">
                                <label for="when_req">When Required</label>
                                <input class="form-control" type="date" required="required" name="when_req" />
                                </div>      
                                <div class="form-group">
                                <label for="dr_no">Contact No</label>
                                <input class="form-control" type="tel" maxlength="10" required="required" name="dr_pno"  placeholder="Contact Number"/>
                            </div> 
                            <div class="form-group">
                                <label for="dr_email">Email Address</label>
                                <input class="form-control" type="email" name="dr_email"  required="required" placeholder="Email Address" />
                            </div>
                         <div class="form-group">
                             <label for="blood_reason">Reason For Blood</label>
                             <textarea name="blood_reason" class="form-control" placeholder="Reason For Blood"></textarea>
                    </div>
                               <div class="form-group">
                                <button class="btn" class="form-control"><span class="glyphicon glyphicon-send"></span> Send Request</button>
                            </div>
                        </form>
                    </div>
                      </div>
                </div>
               
            <div class="row">
                <div class="col-xm-12">
                   <hr></hr>
                    <h3 class="text-center">Copyright &copy bloodshare.com</h3> 
                </div>
            </div>
        </div>             
               
    </body>
</html>
