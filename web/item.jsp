<%-- 
    Document   : item
    Created on : Sep 30, 2019, 10:10:43 PM
    Author     : Parth KaPatel
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            String cid = request.getParameter("cid");
            String rid = request.getParameter("rid");
            String buffer = "<select name='drditem' ><option value='-1' >Select Item</option>";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                Statement st = cn.createStatement();    
                String q1 = "SELECT i_id,i_name FROM item_master i inner join res_to_category rc on i.i_fall_category=rc.c_id WHERE rc.c_id='"+cid+"' and rc.r_id='"+rid+"'";
                ResultSet rs1 = st.executeQuery(q1);
                while(rs1.next())
                { 
                    buffer += "<option value='"+ rs1.getString(1)+"'> "+rs1.getString(2)+"</option>";
                }
                buffer += "</select>";
                response.getWriter().println(buffer);
            }catch(Exception e)
            {
                System.out.println(e);
            }
            
            %>    
    </body>
</html>
