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
public class Ketnoi {
    public static Connection KNCSDL() throws SQLException{
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/qlsp", "root", "");
        return c;
    }
}
