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
       <script>
         $(document).ready(function(){
          $("#patient").change(function(){
                     var value1 = $(this).val();
                     $.get("donate_patient_detail.jsp",{s:value1},function(data){
                      $("#javaquery1").html(data);
                     });
                 }); });
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
                 <h3 class="mainhead3"><i class="glyphicon glyphicon-shopping-cart"></i> Donate Blood</h3><hr>
                  <div class="col-sm-6 col-sm-offset-3 ">
                    <p class="lead_form "><span class="glyphicon glyphicon-tint"></span> Donate Blood</p>
                    <div id="form" class="col-sm-12">
                        <form method="post" action="savedonation.jsp"> <br>
                            <p><b>Please fill the correct detail .For more queries contact our admin.</b></p>
                            <div class="form-group" >
                                
                                <label for="search_type">Select Patient</label>
                                <select name="patient" class="form-control" id="patient">
                                    <option value="-1">--select--</option>
                                    <% 
                
                String Query2= "select * from needblood ";
                 try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(Query2);                 
                    {
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getString("pname")%>"> <%=rs.getString("pname")%> </option>
                 <%
                    }
                 }
                  }
                catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
                %>          
                                </select>
                <input type="text" value="<% out.print(session.getAttribute("donarname")); %>" name="donar_name" class="hidden">
                            </div> 
                            <div id="javaquery1"></div>
                            <br>
                        </form>
                    </div>
                </div>
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
