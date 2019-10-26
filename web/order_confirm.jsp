<%-- 
    Document   : order_confirm
    Created on : Oct 5, 2019, 4:28:42 PM
    Author     : Parth KaPatel
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Confirmation</title>
        
        <style>
            #order{
                border:groove;
                border-radius: 15px;
                padding:15px;
                width:97%;
                background-color:#66CCFF;
                height:auto;
            }
            #summary{
                border:groove;
                border-radius: 15px;
                padding:10px;
                background-color: black;
                color:white;
            }
            #item{
                color:black;
            }
             .maindiv{
                border: groove;
                border-width: 1px;
                border-radius: 15px;
                background-color: aliceblue;
                border-color: tomato;
                height:auto;
               
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
            
            .b1{
                border-radius: 8px;
                background-color: #f4511e;
                border: none;
                color: #FFFFFF;
                text-align: center;
                font-size: 15px;
                font-family: Parkavenue;
                padding: 5px;
                width: 120px;
                height: 40px;
                margin-top: 10px;
                transition: 0.5s;
                box-shadow: 0px 0px #888888;
                letter-spacing: 2px;
                outline: none;
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
             <%  
                String item[] = request.getParameterValues("item");
                int i=0;
                if(item==null)
                {
                    out.print("<b style='font-size:30px;color:red;'> Plz Choice Any item from the Restaurant </b>");
                }
                else
                {
                    out.print("<div id='order'>");
                    out.print("<b style='font-size:30px' id='summary'> Your Order Summary</b><br/><br/>");
                    
                    String v=null;
                    int n=0;
                    StringTokenizer st1=null;
                    for(String value:item)
                    {
                        i++;           
                        out.print("<b style='margin-left:5%;' id='item'>"+i+".&nbsp &nbsp;"+value+"</b>");
                        out.print("<br/>");
                        st1 = new StringTokenizer(value, " ");
                          while(st1.hasMoreTokens())
                          {
                            v=st1.nextToken();
                          }
                          n=n+Integer.parseInt(v);
                    }
                  /* out.println("<br/><b style='margin-left:4%;' id='cart'>Your Cart Value : &#8377;"+n+"</b>");*/
                  out.println("<input class='b1' type='submit' style='text-align: center;' value='Pay "+n+" Rs.' />");
                   out.print("</div>");
                }
            %>   
        </div>
     
    </body>
</html>
