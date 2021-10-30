
         <%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
          try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    st.executeUpdate("delete from sendmsgs where email='"+request.getParameter("email")+"'");                                     
                    
                 response.sendRedirect("admin_inbox.jsp");               
                } 
                catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
            
               
 %>     
