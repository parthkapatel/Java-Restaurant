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
        <title>Add New Restaurant</title>
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
            <h1>Add New Restaurant</h1>
            <form style="text-align: center;" action="AddResSevlet">
                
                <div class="res_add" style="text-align: center">
                    
                    <table style="border: 0px">
                        
                        <tbody>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <h2>Add New Restaurant </h2>
                                </td>
                               
                            </tr>
                            <tr>
                                <td> Enter Restaurant Name: </td>
                                <td> <input type="text" name="txtresname" /></td>
                            </tr>
                            <tr>
                                <td> Enter Restaurant Address </td>
                                <td> <input type="text" name="txtresaddress" /></td>
                            </tr>
                            <tr>
                                <td> Enter Restaurant Contact </td>
                                <td> <input type="text" name="txtrescontact" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center"> <input class="button" type="submit" value="Add Restaurant" name="Add Restaurant" /></td>
                               
                            </tr>
                        </tbody>
                    </table>

                   <br/>
                    
                </div>
                
            </form>
        </div>
    </body>
</html>
