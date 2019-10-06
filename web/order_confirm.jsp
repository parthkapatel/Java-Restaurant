<%-- 
    Document   : order_confirm
    Created on : Oct 5, 2019, 4:28:42 PM
    Author     : Parth KaPatel
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Confirmation</title>
    </head>
    <body>
       
        <h1> <%= session.getAttribute("rname")+" Restaurant<br/>" %> </h1>
        <h3>Your Order List:</h3>
        <h3>
            <%  
                String item[] = request.getParameterValues("item");
                PrintWriter out1 = response.getWriter();
                HttpSession session1 = request.getSession();
                int i=0;
                for(String value:item)
                {
                    i++;

                    out.print(i+"&nbsp &nbsp"+value);
                    out.print("<br/>");
                }
            %>
        </h3>
    </body>
</html>
