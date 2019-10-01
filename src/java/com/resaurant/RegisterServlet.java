/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.resaurant;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
        String name    = request.getParameter("txtname");
        String email   = request.getParameter("txtemail");
        String pwd     = request.getParameter("txtpwd");
        String con_pwd = request.getParameter("txtcon_pwd");
        String contact = request.getParameter("txtcontact");
        String address = request.getParameter("txtaddress");
        PrintWriter pr=response.getWriter();
        if(name.isEmpty() || email.isEmpty() || pwd.isEmpty() || con_pwd.isEmpty() || contact.isEmpty() || address.isEmpty())
        {
            pr.print("<html><script>alert('please enter all details')</script></html>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
        }
        else
        {
                
            if(pwd.equals(con_pwd))
            {

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                } catch (ClassNotFoundException ex) {
                    System.out.println(ex);
                }

                try {
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                    String query="INSERT INTO `user_details`(`email_id`, `name`, `pwd`, `contact`, `address`) VALUES (?,?,?,?,?)";
                    PreparedStatement pstm=cn.prepareStatement(query);
                    pstm.setString(1, email);
                    pstm.setString(2, name);
                    pstm.setString(3, pwd);
                    pstm.setString(4, contact);
                    pstm.setString(5, address);
                    int no=pstm.executeUpdate();


                    if(no>0)
                    {
                        pr.print("<html><script>alert('Successful Register');</script></html>");
                        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                        rd.include(request, response);
                    }
                    else
                    {
                       pr.print("<html><script>alert('Data Not Inserted')</script></html>");
                       RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                       rd.include(request, response);
                    }
                }catch(MySQLIntegrityConstraintViolationException sql)
                {
                    System.out.println(sql);
                    pr.print("<html><script>alert('Email Id is registered! Please use another email id');</script></html>");
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                    rd.include(request, response);
                }
                catch (SQLException ex) {
                    System.out.println(ex);
                    pr.print("<html><script>alert('Data Insert Error')</script></html>");
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                    rd.include(request, response);
                }

            }
            else
            {
                pr.print("<html><script>alert('please enter same password')</script></html>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            }
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
