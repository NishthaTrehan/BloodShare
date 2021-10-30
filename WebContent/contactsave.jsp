<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
                String name = request.getParameter("fname");
                String phn = request.getParameter("pno");
                String message = request.getParameter("msg");
                String email = request.getParameter("email");
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    st.executeUpdate("insert into sendmsgs (fname,pno,msg,email) values('"+name+"', '"+phn+"' ,'"+message+"','"+email+"')");
                    out.print("<div id=\"out\" class=\" has-feedback has-success\"><span class=\"glyphicon glyphicon-remove "
                            + "form-control-feedback \">"
                            + "</span><span class=\"help-block\"><b> Success! </b>Your message has been Successfully sent."
                            + "</span></div>");
                    response.sendRedirect("contactus.jsp");
                } 
                catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
                %>          