

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <%
    String fname = "";
    String msg = "";
    String email = "";
    String pno = "";
      
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        String sql="select * from sendmsgs where email = '"+request.getParameter("email")+"'";
        ResultSet r = smt.executeQuery(sql);
      
     if(r.next()) {
          fname = r.getString("fname");
          msg = r.getString("msg");
          email = r.getString("email");
          pno = r.getString("pno");  
         
      %>



<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><%out.print(fname);%></h4>
      </div>
      <div class="modal-body">
        <p><%out.print(msg);%></p>
        <p><%out.print(email);%></br><%out.print(pno);%></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      
      
    <% }  }catch(Exception e){out.print(e.getMessage());}%>  