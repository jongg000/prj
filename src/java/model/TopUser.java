/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class TopUser {
    private String name;
    private String date;
    private float total_prices;

    public TopUser() {
    }

    public TopUser(String name, String date, float total_prices) {
        this.name = name;
        this.date = date;
        this.total_prices = total_prices;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public float getTotal_prices() {
        return total_prices;
    }

    public void setTotal_prices(float total_prices) {
        this.total_prices = total_prices;
    }
    
    
}
