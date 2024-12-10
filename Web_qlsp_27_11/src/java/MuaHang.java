/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Controller.KNCSDL;
import Model.Product;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class MuaHang extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MuaHang</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MuaHang at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String searchKeyword = request.getParameter("search");
        KNCSDL kn = new KNCSDL();
        List<Product> list = new ArrayList<>();
        try {
            ResultSet rs;
            if(searchKeyword != null && !searchKeyword.isEmpty()) {
                rs = kn.timKiemSanPham(searchKeyword);
            } else {
                rs = kn.getData();
            }

            while (rs.next()) {
                list.add(new Product(rs.getInt("id"), rs.getString("tensp"), rs.getDouble("gia")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        HttpSession session = request.getSession();
        session.setAttribute("products", list);
        session.setAttribute("searchKeyword", searchKeyword); // Lưu từ khóa tìm kiếm
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("./hienthisanpham.jsp");
        dispatcher.forward(request, response);
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
        String action = request.getParameter("action");
        KNCSDL kn = new KNCSDL();

        try {
            if ("add".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String tensp = request.getParameter("tensp");
                double gia = Double.parseDouble(request.getParameter("gia"));
                kn.themSanPham(id, tensp, gia);
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String tensp = request.getParameter("tensp");
                double gia = Double.parseDouble(request.getParameter("gia"));
                kn.suaSanPham(id, tensp, gia);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                kn.xoaSanPham(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("MuaHang");    
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
