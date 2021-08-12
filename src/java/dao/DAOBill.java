/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Bill;
import entity.BillDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hùng
 */
public class DAOBill {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getTotalByHid(String hid) {
        int a = 0;
        String sql = "select total from bill where hid = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, hid);
            rs = ps.executeQuery();
            if (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("loi getTotalByHid" + e.getMessage());
        }
        return a;
    }

    public int addBill(String date, int cid, String name, String address, String phone, int total, String description, int status) {
        int a = 0;
        String sql = "insert into bill(date,cid,Rcname,Raddress,Rphone,total,Description,status) values(?,?,?,?,?,?,?,?)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, date);
            ps.setInt(2, cid);
            ps.setString(3, name);
            ps.setString(4, address);
            ps.setString(5, phone);
            ps.setInt(6, total);
            ps.setString(7, description);
            ps.setInt(8, status);
            a = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("loi addBill" + e.getMessage());
        }
        return a;
    }

    public int getIdBill(int cid) {
        int id = 0;
        String sql = "select top 1 hid from bill where cid = '" + cid + "' order by hid desc  ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("loi getID" + e.getMessage());
        }
        return id;
    }

    public int addBillDetail(int id, int pid, String name, int quantity, int price, int subtotal) {
        int a = 0;
        String sql = "insert into billdetail values(?,?,?,?,?,?)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, pid);
            ps.setString(3, name);
            ps.setInt(4, quantity);
            ps.setInt(5, price);
            ps.setInt(6, subtotal);

            a = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("loi addBillDetail" + e.getMessage());
        }
        return a;
    }
// Controller

    public void DeleteBillByhid(String hid) {
        String sql = "delete from bill where hid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, hid);
            ps.execute();
        } catch (Exception e) {
            System.out.println("loi DeleteBillByHid" + e.getMessage());
        }
    }

    public void DeleteBillDetailByHid(String hid) {
        String sql = "delete from billdetail where hid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, hid);
            ps.execute();
        } catch (Exception e) {
            System.out.println("loi DeleteByHid" + e.getMessage());
        }
    }

    public void UpdateBillByHid(String status, String hid) {
        String sql = "update bill set status=? where hid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, hid);
            ps.execute();
        } catch (Exception e) {
            System.out.println("loi UpdateBillByhid" + e.getMessage());
        }
    }

    public void UpdateBillByTotal(String total, String hid) {
        String sql = "update bill set total=? where hid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, total);
            ps.setString(2, hid);
            ps.execute();
        } catch (Exception e) {
            System.out.println("loi UpdateBillByTotal" + e.getMessage());
        }
    }

    public List<Bill> getBillByStatus(String status) {
        List<Bill> list = new ArrayList<>();
        String sql = "Select * from bill where status=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getBillByStatus" + e.getMessage());
        }
        return list;
    }

    public List<Bill> getAllBill() {
        List<Bill> list = new ArrayList<>();
        String sql = "select * from bill";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getAllBill" + e.getMessage());
        }

        return list;

    }

    public List<BillDetail> getAllBillDetail(String hid) {
        List<BillDetail> list = new ArrayList<>();
        String sql = "select * from billdetail where hid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, hid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BillDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getAllBillDetail" + e.getMessage());
        }

        return list;

    }

}
