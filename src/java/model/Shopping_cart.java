/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class Shopping_cart {
    private int id;
    private float total_prices;
    private String date;
    private int user_id;
    private String last_name;

    public Shopping_cart() {
    }

    public Shopping_cart(int id, float total_prices, String date, int user_id) {
        this.id = id;
        this.total_prices = total_prices;
        this.date = date;
        this.user_id = user_id;
    }

    public Shopping_cart(int id, float total_prices, String date, int user_id, String last_name) {
        this.id = id;
        this.total_prices = total_prices;
        this.date = date;
        this.user_id = user_id;
        this.last_name = last_name;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getTotal_prices() {
        return total_prices;
    }

    public void setTotal_prices(float total_prices) {
        this.total_prices = total_prices;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }
   
    
}
