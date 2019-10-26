<%-- 
    Document   : res_cat_home
    Created on : Oct 3, 2019, 1:46:28 PM
    Author     : Nimesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .maindiv{
                border: groove;
                border-width: 1px;
                border-radius: 15px;
                background-color: aliceblue;
                border-color: tomato;
                
               
            }
            h1{
                border: none;
                border-width: 1px;
                background-color: black;
                color: white;
                padding: 15px;
                margin: 0px 0px 10px 0px ; 
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
            
            .res{
                padding:0px 0px 10px 0px;
                margin: 15px;
                border-radius: 15px;
                border:groove;
                border-color: tomato;  
                border-width: 1px;
                background-color: aquamarine;
                width:400px;
                transition: 1s;
            }
            .res:hover
            {
                background-color: aqua;
                
            }
            h3{
                transition: 1s;
                
                padding:5px;
            }
            h3:hover
            {
               padding:5px;
               border-radius: 15px;
               background-color: #66CCFF;
                color: brown;
               
            }
            h2{
                background-color: black;
                color: white;
                border-radius: 15px;
                padding: 10px;
                margin-top: 0px;
                text-align: center;
                   
            }
            .b1{
                border-radius: 8px;
                background-color: #f4511e;
                border: none;
                color: #FFFFFF;
                text-align: center;
                font-size: 20px;
                font-family: fantasy;
                padding: 10px;
                width: 200px;
                transition: 0.5s;
                margin: 30px 30px 0px 30px;
                box-shadow: 0px 0px #888888;
                letter-spacing: 2px;
            }
            .b1:hover
            {
                border-radius: 15px;
                letter-spacing: 1px;
                box-shadow: 3px 3px #888888;
            }
        </style>
    </head>
    <body>
        
            <div class="maindiv">
                <h1><%= session.getAttribute("rname") %> Restaurant</h1>
                <form action="order_confirm.jsp" method="POST">
                    <table style="margin-left: 2%">
                    <tr>      
                                <%
                                  try{
                                      Class.forName("com.mysql.jdbc.Driver");
                                      Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                                      Statement st = cn.createStatement();    
                                      String q1 = "SELECT mc.c_id,mc.c_name FROM res_to_category rc inner join manage_menu_category mc on rc.c_id=mc.c_id WHERE `r_id`="+session.getAttribute("rid");
                                      ResultSet rs1 = st.executeQuery(q1);
                                      int i=0;
                                      while(rs1.next())
                                      { 

                                         %>
                                         <td>
                                              <div class="res">
                                                  <h2><%= rs1.getString(2) %></h2>
                                                  <div>
                                                      <%
                                                          String q2 = "SELECT i.i_id, i.i_name,i.i_price FROM item_master i inner join res_to_items ri on ri.i_id=i.i_id inner join manage_restaurant mr on mr.r_id=ri.r_id inner join manage_menu_category mc on mc.c_id=ri.c_id where ri.r_id='"+session.getAttribute("rid")+"' and ri.c_id='"+rs1.getString(1)+"'";
                                                          Statement st2 = cn.createStatement();
                                                          ResultSet rs2 = st2.executeQuery(q2);
                                                          while(rs2.next())
                                                          {
                                                              if(rs2.getString(1) != null)
                                                              {
                                                       %>
                                                       <h3><input type="checkbox" name="item" value=" <%= rs2.getString(2) %> <%= rs2.getString(3) %>" /> &nbsp; <%= rs2.getString(3) %> ----- <%= rs2.getString(2) %> 

                                                       </h3>
                                                      <%
                                                            }
                                                          }

                                                      %>
                                                  </div>
                                              </div>
                                         </td>
                                         <% 
                                                i++;
                                                if(i==3)
                                                {
                                                    i=0;
                                                    %>
                                        </tr><tr>
                              <%
                                    }
                                      }
                                  }
                                  catch(SQLException ex)
                                  {
                                      out.print(ex);
                                  }

                              %>
                    </tr>
                </table>
            <center>
                <input class="b1" type="submit" value="Place Order" name="Place Order" style="margin:20px" />
            </center>
                    </form>
            </div>
            
        
    </body>
</html>
