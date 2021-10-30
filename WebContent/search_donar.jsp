

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
        <title>Search Donar</title>
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
        <script>
         $(document).ready(function(){
          $("#city").change(function(){
                     var value1 = $(this).val();
                     $.get("searchblood.jsp",{q:value1},function(data){
                      $("#javaquery1").html(data);
                     });
                 }); });
  </script>
    </head>
    <body>
        <div id="header"></div>      
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h2 class="mainhead2"><span class="glyphicon glyphicon-search"></span> Search Donar Avalibility</h2>
                    <hr/>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li ><a href="donar_reg.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Donar Registration</a></li>
                        <li><a href="needblood.jsp"><i class="glyphicon glyphicon-shopping-cart"></i> Need Blood</a></li>
                        <li class="active"><a href="search_donar.jsp"><i class="glyphicon glyphicon-search"></i> Search Donar</a></li>
                    </ol>
                </div>
            </div>            
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 ">
                    <p class="lead_form "><span class="glyphicon glyphicon-search"></span> Search Donar Avalibility</p>
                    <div id="form" class="col-sm-12">
                        <form method="post"> </br>
                            <p><b>Please fill the correct detail & search your nearest donar.For more queries contact our admin.</b></p>
                            <div class="form-group" >
                                <label for="search_type">Select City</label>
                                <select name="city" class="form-control" id="city">
                                    <% 
                
                String Query2= "select city_name from cities where StateName='UTTAR PRADESH'";
                 try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();//mysql30293
                    ResultSet rs = st.executeQuery(Query2);
                   
                    {
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getString("city_name")%>"> <%=rs.getString("city_name")%> </option>
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
                            </div> 
                            <div id="javaquery1"></div>
                        </form>
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
    </body>
</html>
