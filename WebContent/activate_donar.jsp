 <%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
    String nonactivedonar=request.getParameter("nonactivename");
          try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    st.executeUpdate("UPDATE donar_reg SET activate ='activate' WHERE n_name=('"+nonactivedonar+"');");                                     
                  
                 response.sendRedirect("not_active_donar.jsp");               
                } 
                catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
            
               
 %>     