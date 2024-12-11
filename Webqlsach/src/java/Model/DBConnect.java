/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class DBConnect {
    public Connection conn = null;
    
    public DBConnect() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.cj.jdbc.Driver");
        this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qlsach2","root","");
    }
    
    public ResultSet getData() throws SQLException{
        String sql = "select * from sach";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        return rs;
    }
    
    public boolean addID(String ma, String ten, String tg, String nxb) throws SQLException {
        String sql = "insert into sach (Ma, Ten, Tacgia, NhaXB) values(?,?,?,?)";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, ma); // Đổi từ setInt sang setString
        stm.setString(2, ten);
        stm.setString(3, tg);
        stm.setString(4, nxb);        
        return stm.executeUpdate() > 0;
    }

    public boolean editID(String ma, String ten, String tg, String nxb) throws SQLException {
        String sql = "update sach set Ten = ?, Tacgia = ?, NhaXB = ? where Ma = ?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, ten);
        stm.setString(2, tg);
        stm.setString(3, nxb);
        stm.setString(4, ma); // Đổi từ setInt sang setString
        return stm.executeUpdate() > 0;
    }

    public boolean deleteID(String ma) throws SQLException {
        String sql = "delete from sach where Ma = ?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, ma); // Đổi từ setInt sang setString
        return stm.executeUpdate() > 0;
    }
    
    public ResultSet searchName(String Ten) throws SQLException{
        String sql = "select * from sach where Ten like ?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, "%" + Ten + "%");
        ResultSet rs = stm.executeQuery();
        return rs;
    }
}
