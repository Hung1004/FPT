/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hùng
 */
public class DAOProduct {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

// Admin Control
    public void addProduct( String image, String name, String title, int quantity, int price, int sale, String description, String cid,int size, String color){
        String sql = "insert into product(image,pname,title,quantity,price,sale,descrition,cid,sold,size,color) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            con = new DBContext().getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, image);
            ps.setString(2, name);
            ps.setString(3, title);
            ps.setInt(4, quantity);
            ps.setInt(5, price);
            ps.setInt(6, sale);
            ps.setString(7, description);
            ps.setString(8, cid);
            ps.setInt(9, 0);
            ps.setInt(10, size);
            ps.setString(11, color);
            ps.execute();
        } catch (Exception e) {
             System.out.println("loi addProduct" + e.getMessage());
        }
    } 
    public void updateProduct(int pid, String image, String name, String title, int quantity, float price, float sale, String description, String cid,int sold,int size, String color){
        String sql = "update product set image=?,pname=?,title=?,quantity=?,price=?,sale=?,descrition=?,cid=?,sold=?,size=?,color=? where pid=?";
        try {
            con = new DBContext().getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, image);
            ps.setString(2, name);
            ps.setString(3, title);
            ps.setInt(4, quantity);
            ps.setFloat(5, price);
            ps.setFloat(6, sale);
            ps.setString(7, description);
            ps.setString(8, cid);
            ps.setInt(9, sold);
            ps.setInt(10, size);
            ps.setString(11, color);
            ps.setInt(12, pid);
            ps.execute();
        } catch (Exception e) {
             System.out.println("loi updateProduct" + e.getMessage());
        }
    } 
    public void DeleteProductByPid(String pid) {
        String sql = "delete from product where pid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ps.execute();
        } catch (Exception e) {
            System.out.println("loi DeleteProductByPid"+e.getMessage());
        }
    }
     public List<Product> getAllProductPaging(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from product order by pid\n" +
"			OFFSET ? rows fetch next 10 row only;";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, (index-1)*10);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getAllProductPaging" + e.getMessage());
        }

        return list;
    }
     
     public List<Product> getAllProductTotalMoney() {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from product where sold >0";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getAllProductTotalMoney" + e.getMessage());
        }

        return list;
    }
    public List<Product> getProductBySold(int sold) {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from product where sold = '" + sold + "'";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getProductBySold" + e.getMessage());
        }

        return list;
    }

    public int getSoldMaxProduct() {
        int a = 0;
        String sql = "select  max(sold)  from product";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Loi getSoldMaxProduct" + e.getMessage());
        }
        return a;
    }

    public int getSoldMinProduct() {
        int a = 0;
        String sql = "select  min(sold)  from product ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Loi getSoldMinProduct" + e.getMessage());
        }
        return a;
    }

// Get data
    public int getSumProduct() {
        int a = 0;
        String sql = "select COUNT(pid) from product";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if(rs.next()){
                a = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Loi getSumProduct" + e.getMessage());
        }
        return a;
    }

    public int getQuantityByid(String pid) {
        int a = 0;
        String sql = "select quantity from product where pid=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Loi getQuantityByid" + e.getMessage());
        }
        return a;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from product";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getAllProduct" + e.getMessage());
        }

        return list;
    }

    public List<Product> getAllProductByCid(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from product where cid = ? and quantity >0";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getAllProductByCid" + e.getMessage());
        }

        return list;
    }

    public List<Product> getTopProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 *  from product order by pid desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getTopProduct" + e.getMessage());
        }

        return list;
    }

    public List<Product> getTopProductByCid(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 *  from product where cid ='" + cid + "' and quantity > 0 order by sold desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getTopProduct" + e.getMessage());
        }

        return list;
    }

    public List<Product> getProductById(String id) {
        List<Product> list = new ArrayList<>();
        String sql = "select  *  from product where pid ='" + id + "'";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getProductById" + e.getMessage());
        }

        return list;
    }

    public List<Product> getTopProduct1() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 2 *  from product order by pid desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getTopProduct" + e.getMessage());
        }

        return list;
    }

    public List<Product> getTopSoldProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 *  from product order by sold desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi getTopSoldProduct" + e.getMessage());
        }

        return list;
    }
//Sort

    public List<Product> SortProduct(String cid, String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select *  from product  where cid = '" + cid + "'and quantity >0 order by price desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi SortProduct" + e.getMessage());
        }

        return list;
    }

    public List<Product> SortProductAllDesc(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select *  from product where quantity >0 order by '" + name + "' desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi SortProduct" + e.getMessage());
        }

        return list;
    }

    public List<Product> SortProductAllAsc(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select *  from product where quantity >0 order by '" + name + "' asc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi SortProduct" + e.getMessage());
        }

        return list;
    }

    public List<Product> SortProductAllDesc(String cid, String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select *  from product  where cid = '" + cid + "'and quantity >0 order by '" + name + "' desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi SortProduct" + e.getMessage());
        }

        return list;
    }

    public List<Product> SortProductAllAsc(String cid, String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select *  from product  where cid = '" + cid + "'and quantity >0 order by '" + name + "' asc ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi SortProduct" + e.getMessage());
        }

        return list;
    }
// Search

    public List<Product> SearchProduct(String search) {
        List<Product> list = new ArrayList<>();
        String sql = "select *  from product where pname like ? ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            System.out.println("loi SortProduct" + e.getMessage());
        }

        return list;
    }
// Update

    public void updateProduct() {
        String sql = "update product set(image,pname,tile,quatity,price,sale,descrition,cid) values (?,?,?,?,?,?,?,?) ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

        } catch (Exception e) {
            System.out.println("loi updateProduct" + e.getMessage());
        }

    }

// Card
    public void SubQuantity(int quantity, int sold, int pid) {
        String sql = "update product set quantity = ?, sold = ? where pid =?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, sold);
            ps.setInt(3, pid);
            ps.execute();
        } catch (Exception e) {
            System.out.println("loi SubQuantity" + e.getMessage());
        }
    }

    public int getSoldById(String pid) {
        int a = 0;
        String sql = "select sold from product where pid = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            rs = ps.executeQuery();
            if (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("loi getSoldById" + e.getMessage());
        }
        return a;
    }

    public Product getProduct(String pid) {
        String sql = "select * from product where pid = '" + pid + "'";
        Product p = null;
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12));
            }
        } catch (Exception e) {
        }
        return p;
    }

}
