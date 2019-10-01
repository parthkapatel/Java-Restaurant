<%-- 
    Document   : restaurants
    Created on : Sep 28, 2019, 12:35:41 AM
    Author     : Parth KaPatel
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurants</title>
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
                var url = "item.jsp";
                url += "?id="+ str;
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
    <body>
        <form action="RestaurantServlet" method="POST">
            <input type="submit" value="Logout" formaction="LogoutServlet"/>
            <table border="0">
                <thead>
                    <tr>
                        <th colspan="2">Restaurants</th>
                    </tr>
                </thead>
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
                                String q = "select * from manage_restaurant";
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
                        <td>Enter Quantity</td>
                        <td><input type="number" name="txtquntity" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Order" name="btnorder" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
