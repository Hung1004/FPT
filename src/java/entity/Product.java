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
public class Product {

    private int id;
    private String image;
    private String name;
    private String title;
    private int quantity;
    private int price;
    private int sale;
    private String description;
    private String cid;
    private int sold;
    private int size;
    private String color;
    
    public Product() {
    }
    
    public Product(int id, String image, String name, String title, int quantity, int price, int sale, String description, String cid) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.title = title;
        this.quantity = quantity;
        this.price = price;
        this.sale = sale;
        this.description = description;
        this.cid = cid;
    }

    public Product(int id, String image, String name, String title, int quantity, int price, int sale, String description, String cid, int sold) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.title = title;
        this.quantity = quantity;
        this.price = price;
        this.sale = sale;
        this.description = description;
        this.cid = cid;
        this.sold = sold;
    }

    public Product(int id, String image, String name, String title, int quantity, int price, int sale, String description, String cid, int sold, int size, String color) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.title = title;
        this.quantity = quantity;
        this.price = price;
        this.sale = sale;
        this.description = description;
        this.cid = cid;
        this.sold = sold;
        this.size = size;
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

}
