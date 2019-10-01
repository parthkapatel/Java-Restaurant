/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.resaurant;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        String email = request.getParameter("txtuser");
        String pwd = request.getParameter("txtpwd");
        PrintWriter pr=response.getWriter();
        int count =0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                System.out.println(ex);
                System.out.println("Nimesh");
                
            }
            
            try {
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/restaurant","root","");
                String query="SELECT `email_id`, `pwd` FROM `user_details`";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while(rs.next())
                {
                    if(email.equals(rs.getString("email_id")) && pwd.equals(rs.getString("pwd")))
                    {
                        count++;
                        break;
                    }
                    else{
                       count=0;
                    }
                }
                if(count==1)
                {
                    HttpSession session=request.getSession(true);
                    session.setAttribute("uname",email); 
                    response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
                    response.setHeader("Pragma", "no-cache");
                    response.setDateHeader("Expires", 0); 
                    pr.print("<html><script>alert('LogIn Successful');</script></html>");
                    RequestDispatcher rd=request.getRequestDispatcher("restaurants.jsp");
                    rd.include(request, response);
                    count=0;
                }
                else
                {
                    pr.print("<html><script>alert('Please Enter correct details')</script></html>");
                    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                    rd.include(request, response);
                }
            } catch (SQLException ex) {
                System.out.println(ex);
                pr.print("<html><script>alert('Data Insert Error')</script></html>");
                RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
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
