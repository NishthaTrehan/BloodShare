

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <% 
                String p_name = request.getParameter("patient");
                String donation_date= request.getParameter("donation_date");
                String donar = request.getParameter("donar_name");        
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    st.executeUpdate("insert into donation (patient_name,donar_name,donation_date) values('"+p_name+"','"+donar+"','"+donation_date+"')");                                     
                    
                    response.sendRedirect("donateblood.jsp");
                 } 
                catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
                %>  
                
     <% 
          try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    st.executeUpdate("delete from needblood where pname=('"+p_name+"') ");                                     
                    
                    response.sendRedirect("donateblood.jsp");
                 } 
                catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
                %>