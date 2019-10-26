<%-- 
    Document   : login
    Created on : Sep 27, 2019, 11:04:50 PM
    Author     : Parth KaPatel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
        <style>
            .maindiv{
                margin: auto;
                width: 28%;
                height: 220px;
                border: none solid;
                padding: 0px 0x 10px 0px;
                border-radius: 10px;
                background-color: lightblue;
            }
            .maindiv:hover
            {
                background-color: aquamarine;
            }
            .b1{
                border-radius: 8px;
                background-color: #f4511e;
                border: none;
                color: #FFFFFF;
                text-align: center;
                font-size: 15px;
                font-family: Parkavenue;
                padding: 5px;
                width: 80px;
                height: 40px;
                margin-top: 10px;
                transition: 0.5s;
                box-shadow: 0px 0px #888888;
                letter-spacing: 2px;
            }
            .b1:hover
            {
                border-radius: 15px;
                letter-spacing: 1px;
                box-shadow: 3px 3px #888888;
            }
            th{
                font-size: 30px;
            }
            td{
                padding: 5px;
            }
             h1{
                border: none;
                border-width: 1px;
                background-color: black;
                color: white;
                padding: 15px;
                margin: 0px 0px 5px 0px; 
                border-radius: 10px;
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
            <form action="LoginServlet">   
                <table style="padding: 20px">
                    <h1>
                            Log In
                    </h1>
                    </thead>
                    <tbody>
                        <tr>
                            <td >Enter Email Id :</td>
                            <td><input type="text" name="txtuser" value="" /></td>
                        </tr>
                        <tr>
                            <td >Enter Password :</td>
                            <td> <input type="password" name="txtpwd" value="" /></td>
                        </tr>
                        <tr>
                            <td>
                                
                            </td>
                            <td style="text-align: center">
                                <input class="b1" type="submit" value="Login" />&nbsp;
                                <input class="b1" type="submit" value="Register" name="btn_register" formaction="index.jsp"/>
                            </td>
                        </tr>
                    </tbody>
                </table> 
            </form>
        </div>
    </body>
</html>
