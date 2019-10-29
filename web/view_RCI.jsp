<%-- 
    Document   : view_RCI
    Created on : Oct 29, 2019, 4:43:27 PM
    Author     : Parth KaPatel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Category Details</title>
        <style>
             .maindiv{
                border: groove;
                border-width: 1px;
                border-radius: 15px;    
                background-color: lightblue;
                text-transform: capitalize;
            }
            h1{
                border: groove;
                border-width: 1px;
                background-color: black;
                color: white;
                padding: 15px;
                margin: 10px 5px 5px 5px; 
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
            .res_add
            {
                margin:10px 400px 0px 400px;
                
            }
            .button{
                border-radius: 8px;
                background-color: #f4511e;
                border: none;
                color: #FFFFFF;
                text-align: center;
                font-size: 15px;
                padding: 10px;
                width: 200px;
                transition: 0.5s;
                margin: 30px 30px 0px 30px;
                box-shadow: 0px 0px #888888;
            }
            .button:hover
            {
                border-radius: 15px;
                box-shadow: 3px 3px #888888;
            }
            
            #btnhome{
                float:right;
                margin:20px 20px;
                padding:15px;
                text-decoration: none;
                color:white;
            }
            
            
        </style>
    </head>
    <body>
        <div class="maindiv">
            
            <a id="btnhome" href="admin_home.jsp">Home</a>
            <h1>Restaurant-Category-Item Details</h1>
                
                <div class="res_add" style="text-align: center">
                    <center>
                        
                        <table border="1" >
                            <tbody>
                                <tr>
                                    <td>Restaurant Name</td>
                                    <td>Category Name</td>
                                    <td>Item Name</td>
                                </tr>
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                                    Statement st = cn.createStatement();
                                    String q = "SELECT mr.r_name,mmc.c_name,im.i_name FROM res_to_items ri inner join manage_restaurant mr on mr.r_id=ri.r_id inner join manage_menu_category mmc on mmc.c_id=ri.c_id inner join item_master im on im.i_id=ri.i_id ORDER BY mr.r_name";
                                    ResultSet rs = st.executeQuery(q);
                                    while(rs.next())
                                    {
                                %>
                                <tr>
                                    <td><%=rs.getString(1) %></td>
                                    <td><%=rs.getString(2) %></td>
                                    <td><%=rs.getString(3) %></td>
                                    <td><a href="updatecategory.jsp?id=<%= rs.getString(1)%>">Update</td>
                                    <td><a href="deletecategoryservlet?id=<%= rs.getString(1)%>">Delete</td>
                                </tr>
                                <%
                                    }
                                    cn.close();
                                %>
                            </tbody>
                        </table>

                    </center>
                   <br/>
                    
                </div>   
        </div>
    </body>
</html>
