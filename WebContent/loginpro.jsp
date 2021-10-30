<html>
    <head>
        <title>Login Failed</title>
    </head>
    <body>
        <%
String username = request.getParameter("aname");
String password = request.getParameter("apwd");
if(username.equals("nishtha") && password.equals("nishtha@123"))
    {
    session.setAttribute("adminname",username);
    session.setAttribute("adminpassword",password);
    response.sendRedirect("admin_inbox.jsp");
}
else out.print("<br>Username or Password may be wrong.Try Again  ");
        %><a href="admin.html">Login</a>  
    </body>
</html>

