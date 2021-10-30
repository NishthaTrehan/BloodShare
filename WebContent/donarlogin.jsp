<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <%
String username = request.getParameter("dname");
String password = request.getParameter("dpwd");
String name = "";
String pwd = "";
try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet r = smt.executeQuery("select * from donar_reg");
        while (r.next()) {
          name = r.getString("n_name");
          pwd = r.getString("n_pwd");
          if(username.equals(name) && password.equals(pwd))
            {
            session.setAttribute("donarname",username);
            session.setAttribute("donarpassword",password);
            response.sendRedirect("donar_index.jsp");
            }
		}
           out.print("<br>Username or Password may be wrong.Try Again  ");
       %> 
      
       <a href="donarlogin.html">Login</a>  
       
       <%        
                  
   } catch (Exception e) {
        out.print(e.getMessage());
   }
%>
    </body>
</html>

 
       
   