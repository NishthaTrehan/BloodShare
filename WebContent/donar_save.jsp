<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Thank You For Registration</title>
    </head>
    <body>
        <% 
                String n_name = request.getParameter("n_name");
                String n_fname= request.getParameter("n_fname");
                String n_gender = request.getParameter("n_gender");
                String n_blood = request.getParameter("n_blood");
                String n_weight = request.getParameter("n_weight");
                String n_pno = request.getParameter("n_pno");
                String n_email = request.getParameter("n_email");
                String n_country = request.getParameter("n_country");
                String n_state = request.getParameter("n_state");
                String n_city = request.getParameter("n_city");
                String n_address = request.getParameter("n_address");
            //  String agree = request.getParameter("agree");
                String n_dob = request.getParameter("n_dob");
                String status = request.getParameter("status");
                String npassword = request.getParameter("n_password");
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    st.executeUpdate("insert into donar_reg (n_name,n_fname,n_gender,n_blood,n_weight,n_pno,n_email,"
                            + "n_country,n_state,n_city,n_address,n_dob,activate,n_pwd) values('"+n_name+"','"+n_fname+"','"+n_gender+"',"
                            + "'"+n_blood+"','"+n_weight+"','"+n_pno+"','"+n_email+"','"+n_country+"','"+n_state+"','"+n_city+"',"
                            + "'"+n_address+"','"+n_dob+"','"+status+"','"+npassword+"')");
                     out.print("Registration successful");%> 
                            <p>Click here for <a href="donarlogin.html"> login</a></p>    
                            
                <%
                            } 
                catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
                %>   
    </body>
</html>
 