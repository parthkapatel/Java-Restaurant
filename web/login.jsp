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
    </head>
    <body>
    <center>
        <form action="LoginServlet">
            <table>
                <thead>
                    <th colspan="2">
                        Log In
                    </th>
                </thead>
                <tbody>
                    <tr>
                        <td>Enter Email Id</td>
                        <td><input type="text" name="txtuser" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter Password</td>
                        <td> <input type="password" name="txtpwd" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <input type="submit" value="Login" />&nbsp;<input type="reset" value="Cancel" /> &nbsp;
                            <input type="submit" value="Register" name="btn_register" formaction="index.jsp"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
    </body>
</html>
