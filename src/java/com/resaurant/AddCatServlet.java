/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.resaurant;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Parth KaPatel
 */
@WebServlet(name = "AddCatServlet", urlPatterns = {"/AddCatServlet"})
public class AddCatServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
        String rid = request.getParameter("drdrid");
        String cid = request.getParameter("drdcid");
        PrintWriter pr=response.getWriter();
        int count = 0;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    
                } catch (ClassNotFoundException ex) {
                    System.out.println(ex);
                }
                    
                    String q = "select * from res_to_category rc where rc.r_id='"+rid+"' and rc.c_id='"+cid+"'";
                    Statement st = cn.createStatement();
                    ResultSet rs = st.executeQuery(q);
                    while(rs.next())
                    {
                        if(rid.equals(rs.getString("r_id")) && cid.equals(rs.getString("c_id")))
                        {
                            count++;
                            break;
                        }
                        else{
                           count=0;
                        }
                    }
                    if(count == 0)
                    {
                        try {

                            String query="INSERT INTO `res_to_category`(`r_id`, `c_id`) VALUES(?,?)";
                            PreparedStatement pstm1=cn.prepareStatement(query);
                            pstm1.setString(1, rid);
                            pstm1.setString(2, cid);
                            int no=pstm1.executeUpdate();


                            if(no>0)
                            {
                                pr.print("<html><script>alert('Successful Add Category');</script></html>");
                                RequestDispatcher rd=request.getRequestDispatcher("admin_add_item.jsp");
                                rd.include(request, response);
                            }
                            else
                            {
                               pr.print("<html><script>alert('Data Not Inserted')</script></html>");
                               RequestDispatcher rd=request.getRequestDispatcher("admin_add_cat.jsp");
                               rd.include(request, response);
                            }
                        }
                        catch (SQLException ex) {
                            System.out.println(ex);
                            pr.print("<html><script>alert('Data Insert Error')</script></html>");
                            RequestDispatcher rd=request.getRequestDispatcher("admin_add_cat.jsp");
                            rd.include(request, response);
                        }
                    }
                    else{
                        pr.print("<html><script>alert('Data Already Exist')</script></html>");
                        RequestDispatcher rd=request.getRequestDispatcher("admin_add_cat.jsp");
                        rd.include(request, response);
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
       
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddCatServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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
        
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddCatServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
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
