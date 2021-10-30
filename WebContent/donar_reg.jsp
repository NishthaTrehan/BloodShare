
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Donor Registration</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/font-awesome.css" type="text/css"/>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
         <script>
        $(function()
        {
          $("#header").load("header.html");  
        });
        </script>
        </head>
    <body >
                <div id="header"></div>      
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h2 class="mainhead2"><i class="fa fa-user-plus" aria-hidden="true"></i> New Donor Registration</h2>
                    <hr/>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="active"><a href="donar_reg.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Donar Registration</a></li>
                        <li><a href="needblood.jsp"><i class="glyphicon glyphicon-shopping-cart"></i> Need Blood</a></li>
                        <li><a href="search_donar.jsp"><i class="glyphicon glyphicon-search"></i> Search Donor</a></li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5 col-sm-offset-3">
                            
                    <p class="lead_form "><i class="fa fa-user-plus" aria-hidden="true"></i> <b>JOIN AS BLOOD DONOR</b></p>
                    <div id="form" class="col-sm-12">
                        <form method="post" action="donar_save.jsp"> </br>
                            <div class="form-group">
                                <label for="n_name">Full Name</label>
                                <input class="form-control " type="text"  required="required" name="n_name" placeholder="Full Name" />
                            </div>
                            <div class="form-group">
                                <label for="n_fname">Father Name</label>
                                <input class="form-control " type="text"  required="required" name="n_fname" placeholder="Father Name" />
                            </div>
                            <div class="form-group">
                                <label for="n_gender">Gender</label>
                                <select name="n_gender" class="form-control">
                                    <option value="-1">--Select--</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>   
                            <div class="form-group">
                                <label for="n_dob">D.O.B</label>
                                <input class="form-control" type="date" required="required" name="n_dob"  />
                            </div>      
                            <div class="form-group">
                                <label for="n_blood">Blood Group</label>
                                <select name="n_blood" class="form-control">
                                    <option value="-1">Select Blood</option>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                            </div>   
                            <div class="form-group">
                                <label for="n_weight">Body Weight</label>
                                <input class="form-control" type="number" min="0" required="required" name="n_weight"  placeholder="Weight in Kgs"/>
                            </div> 
                            <div class="form-group">
                                <label for="n_pno">Contact No</label>
                                <input class="form-control" type="text" maxlength="10" required="required" name="n_pno"  pattern="[1-9]{1}[0-9]{9}" placeholder="Contact Number"/>
                            </div> 
                            <div class="form-group">
                                <label for="n_email">Email Address</label>
                                <input class="form-control" type="email" name="n_email"  required="required" placeholder="Email Address" />
                            </div>
                           <div class="form-group">
                                <label for="n_country">Country</label>
                                <select name="n_country" class="form-control">
                                    <option value="-1">Select Country</option>
             <% //Connection con=null;
              String Query= "select countries_name from countries";
                 try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(Query);
                    while(rs.next())
                    {
            %>
                        <option value="<%=rs.getString("countries_name")%>"> <%=rs.getString("countries_name")%> </option>
                        <%
                   }
             } 
                     catch(Exception e)
                {       
                
                out.print(e.getMessage());
                }
               %>  
           </select>
                            </div> 
                                    <div class="form-group">
                                <label for="n_state">State</label>
                                <select name="n_state" class="form-control">
                                    <option value="-1">Select State</option>
                                                       <% 
                String Query1= "select StateName from states";
                 try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(Query1);
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getString("StateName")%>"> <%=rs.getString("StateName")%> </option>
                        <%
                    }
                } 
                catch(Exception e)
                {       
                
               // out.print(e.getMessage());
               out.println("not connected");
                }
                %>  
                                  </select>
                            </div> 
                                    <div class="form-group">
                                <label for="n_city">City</label>
                                <select name="n_city" class="form-control">
                                    <option value="-1">Select City</option>
                 <% 
                
                String Query2= "select city_name from cities where StateName='UTTAR PRADESH'";
                 try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank?autoReconnect=true&useSSL=false","root","nishtha111");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(Query2);
                   
                    {
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getString("city_name")%>"> <%=rs.getString("city_name")%> </option>
                        <%
                    }
                 }
                  }
                catch(Exception e)
                {       
                
               out.print(e.getMessage());
               // out.println("not connected");
                }
                %>                      
                                </select>
                            </div> 
                    <div class="form-group">
                        <label for="n_address">Address</label>
                        <textarea name="n_address" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="n_password">Password</label>
                        <input type="password" name="n_password" class="form-control"/>
                    </div>
                     <div class="form-group">
                        <label for="status"></label>
                        <input type="text" name="status" value="deactivate" class="hidden">
                    </div>
                   <!--    <div class="form-group">
                       <label  for="agree"></label>
                             <input type="checkbox" name="agree" required="required" /><p style="color: #255625; display:inline">I have read the eligibility criteria and confirm that I am eligible to donate blood.</p>
                    </div>-->
            
                               <div class="form-group">
                                <button class="btn form-control"><span class="glyphicon glyphicon-send"></span> Register Now</button>
                            </div>
                        </form>
                    </div>
                      </div>
                </div>
               
            <div class="row">
                <div class="col-xm-12">
                   <hr>
                    <h3 class="text-center">Copyright &copy bloodshare.com</h3> 
                </div>
            </div>
        </div>
                               
     </body>
</html>
