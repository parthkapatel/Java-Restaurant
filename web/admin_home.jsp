<%-- 
    Document   : admin_home
    Created on : Oct 5, 2019, 12:29:19 PM
    Author     : Nimesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <style>
            .add_rci
            {
                border: groove;
                border-width: 1px;
                border-color: black;
                width: 100px;
                padding: 10px;
                display: inline;
                color: black;
                transition: 1s;
                margin: 10px 10px 0px 10px;
                 box-shadow: 5px 8px mediumslateblue; 
            }
            .add_rci:hover{
                background-color: black;
                border-radius: 5px;
                
                color: white;
                 box-shadow: 5px 8px #888888; 
               
                
            }
            
            a{
                text-decoration: none;
               
            }
            .maindiv{
                border: groove;
                border-width: 1px;
                border-radius: 15px;
                height: 500px;
                
               
            }
            h1{
                border: groove;
                border-width: 1px;
                background-color: black;
                color: white;
                padding: 15px;
                margin: 10px 5px 25px 5px; 
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
           
        </style>
    </head>
    <body>
        <div class="maindiv">
            <h1>ADMIN</h1>

            <a href="admin_add_res.jsp">
                <div class="add_rci">
                    Add Restarant
                </div>
            </a>
            <a href="admin_add_cat.jsp">   
            <div class="add_rci">
                Add Category
            </div>
            </a>
             <a href="admin_add_item.jsp">
            <div class="add_rci">
               Add Item
            </div>
            </a>    
        
      </div>
    </body>
</html>
