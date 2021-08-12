/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author Hùng
 */
public class BillDetailCustomer {

    private String hid;
    private String pid;
    private String image;
    private String name;
    private String cname;
    private Date date;
    private int quantity;
    private int price;
    private int subtotal;
    private int status;
    
    public BillDetailCustomer() {
    }

    public BillDetailCustomer(String hid, String pid, String image, String name, String cname, Date date, int quantity, int price, int subtotal, int status) {
        this.hid = hid;
        this.pid = pid;
        this.image = image;
        this.name = name;
        this.cname = cname;
        this.date = date;
        this.quantity = quantity;
        this.price = price;
        this.subtotal = subtotal;
        this.status = status;
    }

    public BillDetailCustomer(String hid, String pid, String image, String name, Date date, int quantity, int price, int subtotal, int status) {
        this.hid = hid;
        this.pid = pid;
        this.image = image;
        this.name = name;
        this.date = date;
        this.quantity = quantity;
        this.price = price;
        this.subtotal = subtotal;
        this.status = status;
    }
    
    
    public BillDetailCustomer(String image, String name, Date date, int quantity, int price, int subtotal, int status) {
        this.image = image;
        this.name = name;
        this.date = date;
        this.quantity = quantity;
        this.price = price;
        this.subtotal = subtotal;
        this.status = status;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getHid() {
        return hid;
    }

    public void setHid(String hid) {
        this.hid = hid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

   

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}