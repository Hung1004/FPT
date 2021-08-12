/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.BillDetail;
import entity.BillDetailCustomer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hùng
 */
public class DAOBillDetail {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void DeleteBillDetailByHid_Pid(String hid, String pid) {
        String sql = "delete from billdetail where hid=? and pid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, hid);
            ps.setString(2, pid);
            ps.execute();
        } catch (Exception e) {
            System.out.println("loi DeleteByHid" + e.getMessage());
        }
    }

    public int getNumHidByHid_Pid(String hid) {
        int a = 0;
        String sql = "select  count(hid)  from billdetail  where hid = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, hid);
            rs = ps.executeQuery();
            if (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("loi getNumHidByHid_Pid" + e.getMessage());
        }
        return a;
    }

    public List<BillDetailCustomer> getBillDetailCustomer(String cid) {
        List<BillDetailCustomer> list = new ArrayList<>();
        String sql = "select a.hid,b.pid,c.image,c.pname,a.date,b.quantity, b.price, b.subtotal,a.status from bill a \n"
                + "join billdetail b on a.hid = b.hid join product c on b.pid = c.pid where a.cid = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BillDetailCustomer(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getBillDetailCustomer" + e.getMessage());
        }
        return list;
    }

    public List<BillDetailCustomer> getBillDetailAdmin(String hid) {
        List<BillDetailCustomer> list = new ArrayList<>();
        String sql = "select a.hid,b.pid, c.image,c.pname,b.name,a.date,b.quantity, b.price, b.subtotal,a.status from bill a \n"
                + "join billdetail b on a.hid = b.hid join product c on b.pid = c.pid where a.hid = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, hid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BillDetailCustomer(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getBillDetailCustomer" + e.getMessage());
        }
        return list;
    }
}
