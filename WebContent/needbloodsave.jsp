<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
                String p_name = request.getParameter("pname");
                String p_gender= request.getParameter("p_gender");
                String p_blood = request.getParameter("p_blood");
                String unit_of_blood = request.getParameter("unit_of_blood");
                String h_address = request.getParameter("h_address");
                String dr_name = request.getParameter("dr_name");
                String when_req = request.getParameter("when_req");
                String dr_pno = request.getParameter("dr_pno");
                String dr_email = request.getParameter("dr_email");
                String blood_reason = request.getParameter("blood_reason");
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    st.executeUpdate("insert into needblood ( pname,pgender,pblood,unit_of_blood ,h_address,dr_name,when_req,"
                            + " dr_pno,dr_email,blood_reason)"
                            + "values('"+p_name+"', '"+p_gender+"' ,'"+p_blood+"','"+unit_of_blood+"',"
                            + "'"+h_address+"','"+dr_name+"','"+when_req+"','"+dr_pno+"','"+dr_email+"',"
                            + "'"+blood_reason+"')");
                    out.print("<div id=\"out\" class=\" has-feedback has-success\"><span class=\"glyphicon glyphicon-remove "
                            + "form-control-feedback \">"
                            + "</span><span class=\"help-block\"><b> Success! </b>Thank You For Registration."
                            + "</span></div>"); 
                     response.sendRedirect("needblood.jsp");
                            %> 
                              <%
                            } 
                catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
                %>   