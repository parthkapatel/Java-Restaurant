<%-- 
    Document   : res_cat_home
    Created on : Oct 3, 2019, 1:46:28 PM
    Author     : Nimesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .maindiv{
                border: groove;
                border-width: 1px;
                border-radius: 15px;
                background-color: aliceblue;
               
            }
            h1{
                border: groove;
                border-width: 1px;
                background-color: black;
                color: white;
                padding: 15px;
                margin: 10px; 
                border-radius: 15px;
                text-align: center;
                text-shadow: 2px 5px 5px #FF0000;
                text-transform: capitalize;
                transition: 1s;
                
            }
            h1:hover
            {
                letter-spacing: 2px;
                
            }
            
            .res{
                padding:0px 0px 10px 0px;
                margin: 15px;
                
                border-radius: 15px;
                border:groove;
                background-color: aquamarine;
                width:500px;
                transition: 1s;
            }
            .res:hover
            {
                background-color: aqua;
                
            }
            h3{
                transition: 1s;
                
                padding:5px;
            }
            h3:hover
            {
               padding:5px;
               border-radius: 15px;
               background-color: darkgrey;
                color: brown;
               
            }
            h2{
                background-color: black;
                color: white;
                border-radius: 15px;
                padding: 10px;
                margin-top: 0px;
                   
            }
        </style>
    </head>
    <body>
        <form action="order_conf">
            <div class="maindiv">
                <h1><%= session.getAttribute("rname") %> Restaurant</h1>
                <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                Statement st = cn.createStatement();    
                String q1 = "SELECT mc.c_id,mc.c_name FROM res_to_category rc inner join manage_menu_category mc on rc.c_id=mc.c_id WHERE `r_id`="+session.getAttribute("rid");
                ResultSet rs1 = st.executeQuery(q1);
                while(rs1.next())
                { 
                    
                   %>
                   
                   <div class="res">
                       <h2><%= rs1.getString(2) %></h2>
                       <div>
                           <%
                               String q2 = "SELECT i.i_name,i_price FROM item_master i inner join manage_menu_category mc on i_fall_category=mc.c_id WHERE c_id="+rs1.getString(1);
                               Statement st2 = cn.createStatement();
                               ResultSet rs2 = st2.executeQuery(q2);
                               while(rs2.next())
                               {
                            %>
                            <h3><input type="checkbox" name="item" value="<%= rs2.getString(1) %> <%= rs2.getString(2) %>" /> &nbsp; <%= rs2.getString(1) %> ----- <%= rs2.getString(2) %> 
                                
                            </h3>
                           <%
                               }
                               
                           %>
                       </div>
                   </div>
                   
                   <%
                       
                  
                   
                }
            }
            catch(SQLException ex)
            {
                out.print(ex);
            }
                    
        %>
            </div>
            <center>
                <input type="submit" value="Place Order" name="Place Order" style="margin:100px" />
            </center>
        </form>
    </body>
</html>
