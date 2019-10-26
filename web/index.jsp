<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .maindiv{
                margin: auto;
                width: 28%;
                height: 400px;
                border: none;
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
                border-width: 0px;
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
          <form action="RegisterServlet" method="POST">
            <table border="0">
                <h1>
                    Register Here!
                </h1>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Enter Name : </td>
                        <td><input type="text" name="txtname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter Email id : </td>
                        <td><input type="text" name="txtemail" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter Password : </td>
                        <td><input type="password" name="txtpwd" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter Confirm Password : </td>
                        <td><input type="password" name="txtcon_pwd" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter Mobile No. : </td>
                        <td><input type="text" name="txtcontact" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter Address : </td>
                        <td><textarea name="txtaddress" rows="4" cols="21">
                            </textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2" style="text-align: center"><input class="b1" type="submit" value="Register" name="btn_register" />&nbsp;
                            <input class="b1" type="submit" value="Login" name="btn_login" formaction="login.jsp"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
        </div>
        
    </body>
</html>
