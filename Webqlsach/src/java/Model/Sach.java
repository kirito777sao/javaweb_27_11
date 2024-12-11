/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Sach {
    private String ma; // Đổi từ int sang String
    private String ten;
    private String tacgia;
    private String nxb;

    public Sach() {
    }

    public Sach(String ma, String ten, String tacgia, String nxb) {
        this.ma = ma; // Đổi từ int sang String
        this.ten = ten;
        this.tacgia = tacgia;
        this.nxb = nxb;
    }

    public String getMa() {
        return ma; // Đổi từ int sang String
    }

    public void setMa(String ma) {
        this.ma = ma; // Đổi từ int sang String
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getTacgia() {
        return tacgia;
    }

    public void setTacgia(String tacgia) {
        this.tacgia = tacgia;
    }

    public String getNxb() {
        return nxb;
    }

    public void setNxb(String nxb) {
        this.nxb = nxb;
    }
}
