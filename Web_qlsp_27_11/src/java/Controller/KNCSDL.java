/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Admin
 */
public class KNCSDL {
    public Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/qlsp";
    public Connection ketnoi() throws ClassNotFoundException{
        Class.forName("com.mysql.cj.jdbc.Driver");
        try {
            conn = DriverManager.getConnection(url,"root","");
        } catch (SQLException ex) {
            Logger.getLogger(KNCSDL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    public static void main(String[] arg){
        try {
            KNCSDL kn = new KNCSDL();
            kn.ketnoi();
            System.out.println("OK");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KNCSDL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    // Lấy dữ liệu sản phẩm
    public ResultSet getData() throws ClassNotFoundException, SQLException {
        conn = ketnoi();
        String truyvan = "SELECT * FROM product";
        Statement st = conn.createStatement();
        return st.executeQuery(truyvan);
    }

    // Thêm sản phẩm với ID nhập vào
    public boolean themSanPham(int id, String tensp, double gia) throws SQLException, ClassNotFoundException {
        conn = ketnoi();
        String sql = "INSERT INTO product (id, tensp, gia) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.setString(2, tensp);
        ps.setDouble(3, gia);
        return ps.executeUpdate() > 0;
    }

    // Sửa sản phẩm theo ID
    public boolean suaSanPham(int id, String tensp, double gia) throws SQLException, ClassNotFoundException {
        conn = ketnoi();
        String sql = "UPDATE product SET tensp = ?, gia = ? WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, tensp);
        ps.setDouble(2, gia);
        ps.setInt(3, id);
        return ps.executeUpdate() > 0;
    }

    // Xóa sản phẩm theo ID
    public boolean xoaSanPham(int id) throws SQLException, ClassNotFoundException {
        conn = ketnoi();
        String sql = "DELETE FROM product WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        return ps.executeUpdate() > 0;
    }
    
    // Phương thức tìm kiếm
    public ResultSet timKiemSanPham(String tenSp) throws SQLException, ClassNotFoundException {
        conn = ketnoi();
        String truyvan = "SELECT * FROM product WHERE tensp LIKE ?";
        PreparedStatement ps = conn.prepareStatement(truyvan);
        ps.setString(1, "%" + tenSp + "%");  //Thêm ký tự % để tìm kiếm theo phần tử
        return ps.executeQuery();
    }
}
