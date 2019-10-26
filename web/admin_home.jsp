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
                width: 200px;
                height: 100px;
                padding: 25px;
                display: inline;
                color: black;
                transition: 1s;
                margin: 30px 15px 0px 15px;
                box-shadow: 2px 2px #888888;
            }
            .add_rci:hover{
                background-color: black;
                border-radius: 20px;
                
                color: white;
                  
                 box-shadow: 5px 4px mediumslateblue;
               
                
            }
            
            a{
                text-decoration: none;
            }
            .maindiv{
                border: groove;
                border-width: 1px;
                border-radius: 15px;
                height: 500px;
                background-color: aliceblue;
                border-color: tomato;
               
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
            <br>
            <br>
            <a href="admin_add_res.jsp" >
                <div class="add_rci" >
                    Add New Restarant
                </div>
            </a>
             <a href="admin_addd_category.jsp">
                <div class="add_rci">
                   Add New Category
                </div>
            </a>    
            <a href="admin_addd_item.jsp">
                <div class="add_rci">
                   Add New Item
                </div>
            </a>  
            <a href="admin_add_cat.jsp">   
                <div class="add_rci">
                    Assign Category
                </div>
            </a>
             <a href="admin_add_item.jsp">
                <div class="add_rci">
                   Assign Item
                </div>
            </a>    
           <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <a href="view_res.jsp">
                <div class="add_rci">
                   View Restaurant
                </div>
            </a>  
            <a href="view_cat.jsp">
                <div class="add_rci">
                   View Category
                </div>
            </a>  
            
            <a href="view_item.jsp">
                <div class="add_rci">
                   View Items
                </div>
            </a>  
            <a href="view_order.jsp">
                <div class="add_rci">
                   View Order
                </div>
            </a>  
            <a href="user_details.jsp">
                <div class="add_rci">
                   View User Details
                </div>
            </a>  
        
      </div>
    </body>
</html>
