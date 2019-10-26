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
        <title>Restaurants</title>
        <style>
            .maindiv{
                border: groove;
                border-width: 1px;
                border-radius: 15px;
                background-color: aliceblue;
                border-color: tomato;
            }
            h1{
                border: none;
                border-width: 1px;
                background-color: black;
                color: white;
                padding: 15px;
                margin: 0px 0px 10px 0px ; 
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
            .b1{
                border-radius: 8px;
                background-color: #f4511e;
                border: none;
                color: #FFFFFF;
                text-align: center;
                font-size: 35px;
                font-family: Palatino;
                letter-spacing: 2px;
                padding: 10px;
                transition: 0.5s;
                margin: 30px 30px 0px 30px;
                box-shadow: 0px 0px #888888;
            }
            .b1:hover
            {
                border-radius: 15px;
                letter-spacing: 1px;
                box-shadow: 3px 3px #888888;
            }
        </style>
    </head>
    <body>
        <div class="maindiv">
            <h1>Restaurant</h1>
            <table>
                <tr>
                    
                
                <%
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                        Statement st = cn.createStatement();    
                        String q1 = "SELECT r_id, r_name FROM manage_restaurant";
                        ResultSet rs1 = st.executeQuery(q1);
                        int i=0;
                        while(rs1.next())
                        { 
                           %>
                           <td>
                           <form action="res_homeServlet" >
                               <div class="res">
                               <input type="hidden" value="<%= rs1.getString(1) %>" name="rid" >
                               <input type="hidden" value="<%= rs1.getString(2) %>" name="rname">
                               <input class="b1" type="submit"  value="<%= rs1.getString(2) %>" style="width: 200px;height: 100px" />
                           </div>
                           </form></td>
                           <% 
                               i++;
                               if(i==5)
                               {
                                   i=0;
                                   %>
                                        </tr><tr>
                           <%
                               }
                        }
                    }
                    catch(SQLException ex)
                    {
                        out.print(ex);
                    }

                %>
            </tr>
            </table>
        </div>
      
        
    </body>
</html>
