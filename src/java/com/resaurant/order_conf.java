package com.resaurant;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nimesh
 */
@WebServlet(name = "order_conf",urlPatterns = {"/order_conf"})
public class order_conf extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String item[] = request.getParameterValues("item") ;
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        out.print("<center><b style='font-size:25px'><h1>"+session.getAttribute("rname")+" Restaurant</h1></b></center><br/>");
        if(item==null)
        {
            out.print("<b style='font-size:30px;color:red;'> Plz Choice Any item from the Restaurant </b>");
        }
        else
        {
            out.print("<b style='font-size:30px'> Your Order Summary:</b><br/><br/>");
            int i=0;
            String v=null;
            int n=0;
            StringTokenizer st1=null;
            for(String value:item)
            {
                i++;           
                out.print("<b style='margin-left:5%;'>"+i+".</b>&nbsp &nbsp;"+value);
                out.print("<br/>");
                st1 = new StringTokenizer(value, " ");
                  while(st1.hasMoreTokens())
                  {
                    v=st1.nextToken();
                  }
                  n=n+Integer.parseInt(v);
            }
           out.println("<br/><b style='margin-left:4%;'>Your Cart Value : &#8377;"+n+"</b>");
        }
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
