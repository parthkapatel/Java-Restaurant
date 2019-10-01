<%-- 
    Document   : category
    Created on : Sep 30, 2019, 9:39:13 PM
    Author     : Parth KaPatel
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
            String buffer = "<select name='drdcategory' onchange='showitem(this.value);'><option value='-1' >Select Category</option>";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                Statement st = cn.createStatement();    
                String q1 = "SELECT m.c_id,m.c_name FROM manage_restaurant mr inner JOIN res_to_category r on mr.r_id=r.r_id inner join manage_menu_category m on m.c_id=r.c_id where mr.r_id='"+id+"'";
                ResultSet rs1 = st.executeQuery(q1);
                while(rs1.next())
                { 
                    buffer += "<option value='"+ rs1.getString(1)+"'> "+rs1.getString(2) +"</option>";
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
