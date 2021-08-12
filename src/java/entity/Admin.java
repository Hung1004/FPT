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
public class Admin {
    private String name;
    private String fullname;
    private String pass;
    private String pass2;
    

    public Admin() {
    }

   
    
    public Admin(String name, String fullname, String pass, String pass2) {
        this.name = name;
        this.fullname = fullname;
        this.pass = pass;
        this.pass2 = pass2;
    }

    public Admin(String name, String pass, String pass2) {
        this.name = name;
        this.pass = pass;
        this.pass2 = pass2;
    }

    public Admin(String pass, String pass2) {
        this.pass = pass;
        this.pass2 = pass2;
    }

   
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass2() {
        return pass2;
    }

    public void setPass2(String pass2) {
        this.pass2 = pass2;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

  
    
    
}
