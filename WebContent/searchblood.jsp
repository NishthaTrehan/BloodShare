<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
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
            $(document).ready(function(){
                 $("#blood").change(function(){
                     var value = $(this).val();
                     $.get("search.jsp",{s:value},function(data){
                      $("#javaquery").html(data);
                     });
                 });
             });
        </script>
    </head>
    
    <body>
        
        <div class="form-group" >
                                <label for="p_blood">Available Blood Group</label>
                                <select name="p_blood" class="form-control" id="blood">
                                                <%
   String bloodgroup = "";
   String q = request.getParameter("q");
   try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet rk = smt.executeQuery("select * from donar_reg where(n_city='"+q+"' && activate='activate');");
        %>  <option value="-1">--Select--</option> <%
        while (rk.next()) {  %>
    <option value="<%=rk.getString("n_blood")%>"> <%=rk.getString("n_blood")%> </option>
    <%
         }
   } catch (Exception e) {
        e.printStackTrace();
   }
  
%>
                                </select>
        </div>
                            <div id="javaquery"></div>

                 
    </body>
</html>

