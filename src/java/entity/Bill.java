/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Hùng
 */
public class Bill {
    private int id; 
    private String date; 
    private int cid; 
    private String name; 
    private String address; 
    private String phone; 
    private int total; 
    private String description; 
    private int status; 

    public Bill() {
    }

    public Bill( String date, int cid, String name, String address, String phone, int total,String description, int status) {
        this.date = date;
        this.cid = cid;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.total = total;
        this.description = description;
        this.status = status;
    }

    public Bill(int id, String date, int cid, String name, String address, String phone, int total, String description, int status) {
        this.id = id;
        this.date = date;
        this.cid = cid;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.total = total;
        this.description = description;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
