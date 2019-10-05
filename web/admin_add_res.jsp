<%-- 
    Document   : admin_add_res
    Created on : Oct 5, 2019, 1:52:50 PM
    Author     : Nimesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </style>
    </head>
    <body>
        <div class="maindiv">
            <h1>ADMIN</h1>
            <form style="text-align: center">
                
                <div class="res_add" style="text-align: center">
                    
                    <table style="border: 0px">
                        
                        <tbody>
                            <tr>
                                <td colspan="2" style="text-align: center">Add New Restaurant </td>
                               
                            </tr>
                            <tr>
                                <td> Enter Restaurant Name: </td>
                                <td> <input type="text" name="restaurantname" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center"> <input type="submit" value="Add Restaurant" name="Add Restaurant" /></td>
                               
                            </tr>
                        </tbody>
                    </table>

                   <br/>
                    
                </div>
                
            </form>
        </div>
    </body>
</html>
