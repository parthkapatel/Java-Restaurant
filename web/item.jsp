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
            String id = request.getParameter("id");
            String buffer = "<select name='drditem' ><option value='-1' >Select Item</option>";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                Statement st = cn.createStatement();    
                String q1 = "SELECT i.i_id,i.i_name,i.i_price FROM item_master i inner JOIN manage_menu_category m on m.c_id=i.i_fall_category where m.c_id='"+id+"'";
                ResultSet rs1 = st.executeQuery(q1);
                while(rs1.next())
                { 
                    buffer += "<option value='"+ rs1.getString(1)+"'> "+rs1.getString(2) +"----"+ rs1.getString(3)+"</option>";
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
