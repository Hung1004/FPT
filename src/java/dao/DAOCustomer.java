/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hùng
 */
public class DAOCustomer {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
// Login

    public Customer getCustomer(String username, String pass) {
        String sql = "select * from customer where username = ? and password = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));

            }
        } catch (Exception e) {
            System.out.println("Loi getCustomer");
        }
        return null;
    }
    public Customer getCustomer(String cid) {
        String sql = "select * from customer where cid = ? ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));

            }
        } catch (Exception e) {
            System.out.println("Loi getCustomer"+e.getMessage());
        }
        return null;
    }

    public boolean checkDouble(String username) {
        String sql = "select * from customer where username = ? ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                throw new Exception();
            }
        } catch (Exception e) {
            System.out.println("Loi checkDouble" + e.getMessage());
            return false;
        }
        return true;
    }
// RePassword

    public List<Customer> rePassCustomer(String username, String phone) {
        List<Customer> list = new ArrayList<>();
        String sql = "select * from customer where username = ? and phone = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, phone);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)));

            }
        } catch (Exception e) {
            System.out.println("loi repassC");
        }
        return list;
    }
// Register

    public void register(Customer c) {
        String sql = "insert into customer(cname,address,phone,username,password) values(?,?,?,?,?) ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getAddress());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getUsername());
            ps.setString(5, c.getPass());
            rs = ps.executeQuery();
        } catch (Exception e) {
            System.out.println("loi register");
        }
    }
// Customer

    public List<Customer> getAllCustomer() {
        List<Customer> list = new ArrayList<>();
        String sql = "select * from customer";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getAllCustomer" + e.getMessage());
        }

        return list;

    }

    public void DeleteByPid(String cid) {
        String sql = "delete from customer where cid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            ps.execute();
        } catch (Exception e) {
            System.out.println("loi DeleteByPid" + e.getMessage());
        }
    }

    public void UpdateByPid(String name, String address, String phone, String username, String pass, String cid) {
        String sql = "update customer set cname=?,address=?,phone=?,username=?,password=? where cid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.setString(5, pass);
            ps.setString(6, cid);
            ps.execute();
        } catch (Exception e) {
            System.out.println("loi UpdateByPid" + e.getMessage());
        }
    }

    public List<Customer> SearchCustomer(String fullname) {
        List<Customer> list = new ArrayList<>();
        String sql = "select *  from customer where cname like ? ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + fullname + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi SearchCustomer" + e.getMessage());
        }

        return list;
    }
}
