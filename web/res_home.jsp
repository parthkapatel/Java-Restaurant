<%-- 
    Document   : res_home
    Created on : Oct 3, 2019, 11:20:58 AM
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
            .res
            {
                border: groove;
                border-width: 1px;
                margin: 5px;
                width: 200px;
                display: inline-block;
            }
        </style>
    </head>
    <body>
        <h1>Restaurant</h1>
        
        <div class="maindiv">
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                Statement st = cn.createStatement();    
                String q1 = "SELECT r_id, r_name FROM manage_restaurant";
                ResultSet rs1 = st.executeQuery(q1);
                while(rs1.next())
                { 
                    
                   %>
                   <form action="res_homeServlet" >
                   <div class="res">
                       <input type="hidden" value="<%= rs1.getString(1) %>" name="rid" >
                       <input type="hidden" value="<%= rs1.getString(2) %>" name="rname">
                       <input type="submit"  value="<%= rs1.getString(2) %>" style="width: 200px;height: 50px" />
                       
                   </div>
                   </form>
                   <%
                       
                  
                   
                }
            }
            catch(SQLException ex)
            {
                out.print(ex);
            }
                    
        %>
        </div>
      
        
    </body>
</html>
