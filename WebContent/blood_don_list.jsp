<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Admin</title>
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
          $("#admin_header").load("admin_header.html");  
        });
         $(function()
        {
          $("#admin_dashboard").load("admin_dashboard.html"); 
         
        });
  
        
        </script>
        
        
    </head>
    <body>
                                <%
      if(session.getAttribute("adminname")==null){
     out.print("You are not logged in or session expired");
     
     %> <br>
     <a href="admin.html"> Login Here</a>
     <%
        }
        else   {
           out.print("you are in session");         %>

      
        <div id="admin_header"></div>
                                     
        <div class="container">

            
            <div class="row">
                <div id="admin_dashboard"></div>
                <div class="col-sm-9">
                    <h3 class="mainhead3"><span class="glyphicon glyphicon-tint"></span> List of Blood Donated </h3><hr>
         <table class="table table-striped table-hover">
                        <thead>
                        <th>S.No.</th>
                        <th>Patient Name</th>
                        <th>Donar Name</th>
                        <th>Donation Date</th>
                        </thead>
                    <tbody>
                                                                           <%
    String patient = "";
    String donarname = "";
    String donation_date = "";
    
    int srno =1;
      try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet r = smt.executeQuery("select * from donation");
       
        while (r.next()) {
          patient = r.getString("patient_name");
          donarname = r.getString("donar_name");
          donation_date = r.getString("donation_date");
         
              %>
              <tr>
              <td><% out.print(srno); %> 
                            </td>
                            <td>
                              <% out.print(patient); %>
                            </td>
                            <td>
                                <% out.print(donarname); %> 
                         
                           <td>
                                <% out.print(donation_date); %> 
                            </td>
                         <%
         srno=srno+1;
        }
   } catch (Exception e) {
        e.printStackTrace();
   }
%>
              
                    </tbody>
                  </table>
                </div>
            </div>
              <div class="row">
                <div class="col-xm-12">
                   <hr>
                    <h3 class="text-center">Copyright &copy bloodshare.com</h3> 
   
            </div>
        </div>   
        </div>
                    
                <%    }

           %>
    </body>
</html>

