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
        <title>Welcome Donar</title>
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
           out.print("You are in session");    } %>

        <div id="donar_header"></div>
         <div class="container">
            <div class="row">
             <div id="donar_dashboard"></div>
                <div class="col-sm-9"> 
                    <h3 class="mainhead3"><i class="fa fa-users" aria-hidden="true"></i> Profile</h3><hr>
                    <div class="col-sm-3">
                        <table class="table">
                        <tr>
                        <th>Name:</th>
                        </tr>
                        <tr>
                        <th>Father Name:</th><td>    
                        </tr>
                        <tr>
                        <th>Gender:</th>    
                        </tr>
                        <tr>
                        <th>Blood Group:</th>    
                        </tr>
                        <tr>
                        <th>Weight:</th>    
                        </tr>
                        <tr>
                        <th>Contact No:</th>    
                        </tr>
                        <tr>
                        <th>Email:</th>    
                        </tr>
                        <tr>
                        <th>Country:</th>    
                        </tr>
                        <tr>
                        <th>State:</th>    
                        </tr>
                        <tr>
                        <th>City:</th>    
                        </tr>
                        <tr>
                        <th>Address:</th>    
                        </tr>
                        <tr>
                        <th>Date Of Birth:</th>    
                        </tr>
                        <tr>
                        <th>Status:</th>    
                        </tr>
                       </table>
                </div>
                              <%                       
    String name,father,blood,weight,gender,pno,email,country,state,dob,status,address,city = "";
       try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet r = smt.executeQuery("select * from donar_reg where n_name=('"+session.getAttribute("donarname")+"')");
        while (r.next()) {
          name = r.getString("n_name");
          father = r.getString("n_fname");
          email = r.getString("n_email");
          pno = r.getString("n_pno");  
          gender = r.getString("n_gender");  
          blood = r.getString("n_blood");
          weight = r.getString("n_weight");
          country = r.getString("n_country");
          state = r.getString("n_state");
          city = r.getString("n_city");
          dob = r.getString("n_dob");
          status = r.getString("activate");
          address = r.getString("n_address");
      %>
      <div class="col-sm-6">
      <table class="table">
          <tr><td><%out.print(name);%></td></tr>
          <tr><td><%out.print(father);%></td></tr>
          <tr><td><%out.print(gender);%></td></tr>
          <tr><td><%out.print(blood);%></td></tr>
          <tr><td><%out.print(weight);%></td></tr>
          <tr><td><%out.print(pno);%></td></tr>
          <tr><td><%out.print(email);%></td></tr>
          <tr><td><%out.print(country);%></td></tr>
          <tr><td><%out.print(state);%></td></tr>
          <tr><td><%out.print(city);%></td></tr>
          <tr><td><%out.print(address);%></td></tr>
          <tr><td><%out.print(dob);%></td></tr>
          <tr><td><%out.print(status);%></td></tr>
      </table>
      </div>
                </div> 
                                     <%  }
           
   } catch (Exception e) {
        out.print(e.getMessage());
   }

%>
                </div>
                
            </div>
              <div class="row">
                <div class="col-xm-12">
                   <hr>
                    <h3 class="text-center">Copyright &copy bloodshare.com</h3> 
                </div>
              </div>
          </body>
</html>

