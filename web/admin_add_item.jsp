<%-- 
    Document   : admin_add_item
    Created on : Oct 5, 2019, 2:18:01 PM
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
            td{
                text-align: left;
            }
            .button{
                border-radius: 8px;
                background-color: #f4511e;
                border: none;
                color: #FFFFFF;
                text-align: center;
                font-size: 15px;
                padding: 10px;
                margin: 30px 30px 0px 30px;
                width: 200px;
                transition: 0.5s;
                
                box-shadow: 0px 0px #888888;
            }
            .button:hover
            {
                border-radius: 15px;
                box-shadow: 3px 3px #888888;
            }
        </style>
        
            <script>
            
            var XMLHttp;
            
            function showcategory(str)
            {
                if(typeof XMLHttpRequest !== "undefined")
                {
                        xmlHttp = new XMLHttpRequest();
                }
                else if(window.activeXObject)
                {
                        xmlHttp = new ActiveXObject("Microsoft");
                }
                if(xmlHttp===null)
                {
                        alert("Browser does not support XMLHttp Request");
                        return;
                }
                
                var url = "category.jsp";
                url += "?id="+ str;
                xmlHttp.onreadystatechange = restaurantchange;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
            }
            
            function restaurantchange(){
                if(xmlHttp.readyState === 4 || xmlHttp.readyState === "complete")
                {
                    document.getElementById("drdmenu").innerHTML = xmlHttp.responseText;
                }
            }
            
            
            function showitem(str)
            {
                if(typeof XMLHttpRequest !== "undefined")
                {
                        xmlHttp = new XMLHttpRequest();
                }
                else if(window.activeXObject)
                {
                        xmlHttp = new ActiveXObject("Microsoft");
                }
                if(xmlHttp===null)
                {
                        alert("Browser does not support XMLHttp Request");
                        return;
                }
                rid = document.getElementById("drdres").value;
                var url = "item.jsp";
                url += "?cid="+ str+"&rid="+rid;
                xmlHttp.onreadystatechange = categorychange;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
            }
            
            function categorychange(){
                if(xmlHttp.readyState === 4 || xmlHttp.readyState === "complete")
                {
                    document.getElementById("drditem").innerHTML = xmlHttp.responseText;
                }
            }
        </script>
    </head>
    <body oncontextmenu="return false;">
        <div class="maindiv">
            <h1>Add Item</h1>
            <form style="text-align: center" action="AddItemServlet" method="POST">
                
                <div class="res_add" style="text-align: center">
                    
                    <table style="border: 0px">
                        
                      
                        <tbody>
                            <tr>
                                <td>Select Restaurant</td>
                                <td>
                                    <select name="drdres" id="drdres" onchange="showcategory(this.value)">
                                        <option value="-1" >Select Restaurant</option>
                                    <%
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                                        Statement st = cn.createStatement();
                                        String q = "select r_id,r_name from manage_restaurant";
                                        ResultSet rs = st.executeQuery(q);
                                       while(rs.next())
                                        { 
                                    %>    
                                    <option value="<%= Integer.parseInt(rs.getString(1)) %>"><%= rs.getString(2) %></option>
                                        <%
                                        }

                                    %>
                                    </select>
                                </td>      
                            </tr>
                            <tr>
                                <td>Select Menu Category</td>
                                <td>
                                    <select name="drdmenu" id="drdmenu" onchange="showitem(this.value)">
                                    </select></td>       
                            </tr>
                            <tr>
                                <td>Select Item</td>
                                <td>
                                    <select name="drditem" id="drditem">
                                    </select></td>       
                            </tr>
                          
                            <tr>
                                <td colspan="2"><input type="submit" class="button" value="Add Item" name="btnorder" /></td>
                            </tr>
                        </tbody>
                    </table>

                   <br/>
                    
                </div>
                
            </form>
        </div>
    </body>
</html>
