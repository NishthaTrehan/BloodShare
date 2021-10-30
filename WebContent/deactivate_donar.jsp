 <%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
        String name=request.getParameter("activename");
          try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    st.executeUpdate("UPDATE donar_reg SET activate ='deactivate' WHERE n_name=('"+name+"');");                                     
                  
                 response.sendRedirect("active_donar.jsp");               
                } 
                catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
            
               
 %>     