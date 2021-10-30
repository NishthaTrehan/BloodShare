<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Blood request</title>
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
          $("#donar_header").load("donar_header.html");  
        });
        </script>
         <script>
        $(function()
        {
          $("#donar_dashboard").load("donar_dashboard.jsp"); 
        });
        </script>
    </head>
    <body>
               <%
      if(session.getAttribute("donarpassword")==null){
     out.print("You are not logged in or session expired");
     
     %><br>
     <a href="donarlogin.html"> Login Here</a>
     <%
        }
        else   {
           out.print("You are in session");     %>

        <div id="donar_header"></div>
         <div class="container">
            <div class="row">
             <div id="donar_dashboard"></div>
             <div class="col-sm-9">
                 <h3 class="mainhead3"><i class="glyphicon glyphicon-shopping-cart"></i> Blood Requests</h3><hr>
                  <table class="table table-striped table-hover">
                        <thead>
                        <th>S.No.</th>
                        <th>Patient Name</th>
                        <th>Gender</th>
                        <th>Blood</th>
                         <th>Hospital</th>
                          <th>Reason</th>
                          <th>Dr . Contact No.</th>
                    </thead>
                    <tbody>
                                                                           <%
    String pname = "";
    String pgender = "";
    String pblood = "";
    String hospital = "";
    String reason = "";
    int srno =1;
    String pno = "";
   try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet r = smt.executeQuery("select * from needblood");
       
        while (r.next()) {
          pname = r.getString("pname");
          pgender = r.getString("pgender");
          pblood = r.getString("pblood");
          hospital = r.getString("h_address");
          reason = r.getString("blood_reason");
          pno = r.getString("dr_pno");
         %>
                   <tr>
                            <td>
                                <% out.print(srno); %> 
                            </td>
                            <td>
                              <% out.print(pname); %>
                            </td>
                            <td>
                                <% out.print(pgender); %> 
                            </td>
                               <td>
                                <% out.print(pblood); %> 
                            </td>
                              <td>
                                <% out.print(hospital); %> 
                            </td>
                           <td>
                                <% out.print(reason); %> 
                            </td>
                            <td>
                                <% out.print(pno); %> 
                            </td>
                        </tr>   <%
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
           <% } %>
    </body>
</html>
