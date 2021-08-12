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
public class Customer {
    
    private int cid;
    private String name;
    private String address;
    private String phone;
    private String username;
    private String pass;

    public Customer() {
    }

    public Customer(String name, String address, String phone, String username, String pass) {
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.pass = pass;
    }
    
    public Customer(int cid, String name, String address, String phone, String username, String pass) {
        this.cid = cid;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.pass = pass;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }


}