/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class Test_KN {
    public static void main(String[] args) throws SQLException {
        Connection kn = Ketnoi.KNCSDL();
        
        if (kn == null){
            System.out.println("Kết Nối Thất Bại Rồi Đồng Chí Đề Nghị Kiểm Tra Lại @-@");
        } else {
            System.out.println("Kết Nối Thành Công Rồi Đồng Chí Ảo Thật Đấy @@@");
        }
    }
}
