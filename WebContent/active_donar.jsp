
<%@page import="java.sql.ResultSet"%>
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
    <body >
        <div id="admin_header"></div>
        <div class="container">
            <div class="row">
            <div id="admin_dashboard"></div>
                <div class="col-sm-9">
                    <h3 class="mainhead3"><i class="fa fa-users" aria-hidden="true"></i> Active Donors</h3>
                    <hr>
                        <table class="table table-striped">
                        <thead>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Blood Group</th>
                        <th>Contact No</th>
                        <th>City</th>
                        <th>Status</th>
                        </thead>
                          <%
   String name = "";
   String city = "";
   String contact = "";
   String address = "";
   String gender = "";
   String blood = "";
   try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet r = smt.executeQuery("select * from donar_reg where(activate='activate');");
       
        while (r.next()) {
          name = r.getString("n_name");
          
          city = r.getString("n_city");
          contact = r.getString("n_pno");
          address = r.getString("n_address");
          gender = r.getString("n_gender");
          blood = r.getString("n_blood");
 %>
                
                        <tbody>
                            <tr>
                                <td><%out.print(name);%></td>
                                <td><%out.print(gender);%></td>
                                <td><%out.print(blood);%></td>
                                <td><%out.print(contact);%></td>
                                <td><%out.print(city);%></td>
                                <td>
                                    <form method="post" action="deactivate_donar.jsp" style="display:inline;">
                                      <input type="text" name="activename" value="<%out.print(name);%>" class="hidden">
                                        <button class="btn" value="activate">Click To deactivate</button>
                                </form>
                                </td>
                            </tr>
                        </tbody>
 <%        }
   } catch (Exception e) {
        e.printStackTrace();
   }
%>     
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
    </body>
</html>

