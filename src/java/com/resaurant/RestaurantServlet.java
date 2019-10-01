/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.resaurant;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Parth KaPatel
 */
@WebServlet(name = "RestaurantServlet", urlPatterns = {"/RestaurantServlet"})
public class RestaurantServlet extends HttpServlet {

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
        String res = request.getParameter("drdres");
        String category = request.getParameter("drdmenu");
        String item = request.getParameter("drditem");
        String qty = request.getParameter("txtquntity");
        HttpSession session = request.getSession(true);
        String eid = (String) session.getAttribute("uname"); 
        String oid = "11";
        
        PrintWriter pr=response.getWriter();
//        pr.print(res);
//        pr.print(category);
//        pr.print(item);
//        pr.print(qty);
//        pr.print(eid);
        DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
       java.util.Date date = new java.util.Date();
      //  pr.print(df.format(date));
         try {
                    Class.forName("com.mysql.jdbc.Driver");
                } catch (ClassNotFoundException ex) {
                    System.out.println(ex);
                }

                try {
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                    String q = "INSERT INTO `order_details`(`o_id`, `email_id`, `Date`, `total_bill`) VALUES (?,?,?,?)";
                     PreparedStatement pstm=cn.prepareStatement(q);
//                        
                        pstm.setString(1, oid);
                        pstm.setString(2, eid);
                        pstm.setString(3, df.format(date));
                        pstm.setString(4, "0");
                    pstm.executeUpdate();
                   
                }
                catch(SQLException ex)
                {
                    pr.print(ex);
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
