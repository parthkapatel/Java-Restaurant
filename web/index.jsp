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
        <link rel="stylesheet" type="text/css" href="registrationcss.css">
    </head>
    <body>
        <div class="form_div">
            <form action="RegisterServlet" method="POST">
                <table border="0">
                    <thead>
                        <tr>
                            <th colspan="2">Register Here!</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Enter Name</td>
                            <td><input type="text" name="txtname" value="" /></td>
                        </tr>
                        <tr>
                            <td>Enter Email id</td>
                            <td><input type="text" name="txtemail" value="" /></td>
                        </tr>
                        <tr>
                            <td>Enter Password</td>
                            <td><input type="password" name="txtpwd" value="" /></td>
                        </tr>
                        <tr>
                            <td>Enter Confirm Password</td>
                            <td><input type="password" name="txtcon_pwd" value="" /></td>
                        </tr>
                        <tr>
                            <td>Enter Mobile No.</td>
                            <td><input type="text" name="txtcontact" value="" /></td>
                        </tr>
                        <tr>
                            <td>Enter Address</td>
                            <td><textarea name="txtaddress" rows="4" cols="21">
                                </textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" value="LogIn" name="btn_login" formaction="login.jsp"/>&nbsp;
                                <input type="submit" value="Register" name="btn_register" />
                                </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
