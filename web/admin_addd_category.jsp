<%-- 
    Document   : admin_addd_category
    Created on : Oct 26, 2019, 1:40:40 PM
    Author     : Parth KaPatel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Category</title>
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
        </style>
    </head>
    <body>
        <div class="maindiv">
            <h1>Add New Category</h1>
            <form style="text-align: center;" method="POST" action="AddCategoryServlet">
                
                <div class="res_add" style="text-align: center">
                    
                    <table style="border: 0px">
                        
                        <tbody>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <h2>Add New Category </h2>
                                </td>
                               
                            </tr>
                            <tr>
                                <td> Enter Category Name: </td>
                                <td> <input type="text" name="txtcategoryname" /></td>
                            </tr>
                            <tr>
                                <td> Enter Category Description </td>
                                <td> <input type="text" name="txtcategorydesc" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center"> <input class="button" type="submit" value="Add Category" name="Add Category" /></td>
                            </tr>
                        </tbody>
                    </table>

                   <br/>
                    
                </div>
                
            </form>
        </div>
    </body>
</html>
