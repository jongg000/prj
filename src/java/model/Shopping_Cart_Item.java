/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ACER
 */
public class Shopping_Cart_Item {

    private int id;
    private int quantyti;
    private int product_id;
    private float price;
    private int shopping_cart_id;
    private String name;
    private Date date;
    private int user_id;
    private float total_prices;
    public Shopping_Cart_Item() {
    }

    public Shopping_Cart_Item(int shopping_cart_id, float total_prices, int quantyti,   String name, Date date, int user_id) {
        this.quantyti = quantyti;
        this.product_id = product_id;
        this.total_prices = total_prices;
        this.shopping_cart_id = shopping_cart_id;
        this.name = name;
        this.date = date;
        this.user_id = user_id;
    }
       
    public Shopping_Cart_Item(int id, int quantyti, int product_id, float price, int shopping_cart_id) {
        this.id = id;
        this.quantyti = quantyti;
        this.product_id = product_id;
        this.price = price;
        this.shopping_cart_id = shopping_cart_id;
    }

    public Shopping_Cart_Item(int id, int quantyti, int product_id, float price, int shopping_cart_id, String name) {
        this.id = id;
        this.quantyti = quantyti;
        this.product_id = product_id;
        this.price = price;
        this.shopping_cart_id = shopping_cart_id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantyti() {
        return quantyti;
    }

    public void setQuantyti(int quantyti) {
        this.quantyti = quantyti;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setTotal_prices(float total_prices) {
        this.total_prices = total_prices;
    }

    public int getUser_id() {
        return user_id;
    }

    public float getTotal_prices() {
        return total_prices;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getShopping_cart_id() {
        return shopping_cart_id;
    }

    public void setShopping_cart_id(int shopping_cart_id) {
        this.shopping_cart_id = shopping_cart_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }


    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Shopping_Cart_Item{" + "quantyti=" + quantyti + ", product_id=" + product_id + ", shopping_cart_id=" + shopping_cart_id + ", name=" + name + ", date=" + date + ", user_id=" + user_id + ", total_prices=" + total_prices + '}';
    }



    
    

}
