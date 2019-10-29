<%-- 
    Document   : admin_addd_item
    Created on : Oct 26, 2019, 2:46:26 PM
    Author     : Parth KaPatel
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Item</title>
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
                margin:10px 500px 0px 500px;
                
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
            <h1>Add New Item</h1>
            <form style="text-align: center;" method="POST" action="AddNewItemServlet">
                
                <div class="res_add" style="text-align: center">
                    
                    <table style="border: 0px">
                        
                        <tbody>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <h2>Add New Item </h2>
                                </td>
                               
                            </tr>
                            <tr>
                                <td> Enter Item Name: </td>
                                <td> <input type="text" name="txtitemname" /></td>
                            </tr>
                            <tr>
                                <td> Enter Item Price </td>
                                <td> <input type="text" name="txtitemprice" /></td>
                            </tr>
                            <tr>
                                <td> Select Category : </td>
                                <td>
                                    <select name="drdcid"  style="width: 175px">
                                        <option value="12" >...Select Category...</option>
                                         <%
                                             try
                                             {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                                                String q1 = "SELECT c_id,c_name FROM manage_menu_category";
                                                Statement st = cn.createStatement();  
                                                ResultSet rs1 = st.executeQuery(q1);
                                                while(rs1.next())
                                                { 

                                        %>
                                        
                                        <option value="<%= rs1.getString(1) %>"><%= rs1.getString(2) %></option>
                                         <%  
                                                }
                                            }
                                            catch(SQLException ex)
                                            {
                                                out.print(ex);
                                            }

                                        
                                         %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center"> <input class="button" type="submit" value="Add New Item" name="Add New Item" /></td>
                            </tr>
                        </tbody>
                    </table>

                   <br/>
                    
                </div>
                
            </form>
        </div>
    </body>
</html>

