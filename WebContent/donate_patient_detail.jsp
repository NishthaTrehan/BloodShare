<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Search Donar</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/font-awesome.css" type="text/css"/>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    
    <body>
        <%
   String name = "";
   String city = "";
   String contact = "";
   String blood = "";
  
   
   String s = request.getParameter("s");
   try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet r = smt.executeQuery("select * from needblood where(pname='"+s+"' );");
       
        while (r.next()) {
          name = r.getString("pname");
          city = r.getString("h_address");
          contact = r.getString("dr_pno");
          blood = r.getString("pblood");
         
        }
   } catch (Exception e) {
        e.printStackTrace();
   }
%>
                  <table class="table table-striped table-bordered table-hover">
                            <thead>
                                
                                <tr>
                                    <th>Name</th>
                                    <th>Contact No.</th>
                                    <th>Hospital Address</th>
                                    <th>Blood Group</th>
                                    
                                </tr>
                            <tbody>
                                <tr>
                                    <td> <%out.print(name); %> </td>
                                    <td> <%out.print(contact); %> </td>
                                    <td> <%out.print(city); %> </td>
                                     <td> <%out.print(blood); %> </td>
                                   
                                </tr>
                            </tbody>
                        </table>
                                <label for="donation_date">Select Date</label>
                                <input type="date" name="donation_date" class="form-control form-group">
                                <br>
                                <button class="form-control btn">Submit</button>
                                <br>
    </body>
</html>

