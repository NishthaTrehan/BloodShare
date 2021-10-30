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
        
        function f(e){
           // alert(e);
            var xhttp = new XMLHttpRequest();
  xhttp.open("GET","viewmsg.jsp?email="+e, false);
  xhttp.send();
  document.getElementById("ppp").innerHTML = xhttp.responseText;
        }
        function delete_msg(e){
           // alert(e);
            var xhttp = new XMLHttpRequest();
  xhttp.open("GET","deletemsg.jsp?email="+e, false);
  xhttp.send();
  window.location.reload();
  //document.getElementById("ppp").innerHTML = xhttp.responseText;
        }
  
        
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
                    <h3 class="mainhead3"><i class="fa fa-envelope" aria-hidden="true"></i> Inbox
        <%            int i=0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet r = smt.executeQuery("select * from sendmsgs");
        while (r.next()) {
         i=i+1;
           }    %>
       <span class="badge"> <%out.print(i);%></span>
   <%        
   }    
        catch (Exception e) {
        e.printStackTrace();
   }
      %>
                    </h3>
                    <hr>
                    <table class="table  ">
                        <tbody>
                       
                                           <%
    String fname = "";
    String msg = "";
    String email = "";
    String pno = "";
      
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet r = smt.executeQuery("select * from sendmsgs");
      
        while (r.next()) {
          fname = r.getString("fname");
          msg = r.getString("msg");
          email = r.getString("email");
          pno = r.getString("pno");  
         
      %>
          <tr>
              <td>
            <i class="fa fa-envelope" aria-hidden="true"> </i> <b><% out.print(fname);%></b> :  <% out.print(msg.substring(0,20));%>....
         </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
          <td>
                    <!-- Modal 1 -->

                    <button class="btn" data-toggle="modal" data-target="#myModal" onclick="f('<%=email%>')">View</button>
                    <button class="btn"  onclick="delete_msg('<%=email%>')">Delete</button>

        </td></tr>
       </tbody>
       <%  }
           
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
                    
                <%    }

           %>
           <div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
    <div class="modal-content">
        <div id="ppp"></div>
    </div>
  </div>
</div>  
    </body>
</html>

