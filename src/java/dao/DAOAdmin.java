/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Hùng
 */
public class DAOAdmin {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
// Login

    public Admin getAdmin(String username, String pass, String pass2) {
        String sql = "select * from admin where username = ? and password = ? and password2 = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, pass);
            ps.setString(3, pass2);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Admin(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                );

            }
        } catch (Exception e) {
            System.out.println("Loi getAdmin");
        }
        return null;
    }

    public boolean checkDouble(String username) {
        String sql = "select * from admin where username = ? ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Loi checkDouble" + e.getMessage());
            return false;
        }
        return true;
    }
// RePassword

    public Admin rePassAdmin(String username) {
        String sql = "select * from admin where username = ? ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Admin(rs.getString(3),
                        rs.getString(4));

            }
        } catch (Exception e) {
            System.out.println("loi repasA");
        }
        return null;
    }
// Register

    public void register(Admin c) {
        String sql = "insert into admin(username,fullname,password,password2) values(?,?,?,?) ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getFullname());
            ps.setString(3, c.getPass());
            ps.setString(4, c.getPass2());
            ps.executeQuery();
        } catch (Exception e) {
            System.out.println("loi register");
        }
    }

}
