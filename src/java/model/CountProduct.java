/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class CountProduct {
    private int product_id;
    private int so_lan_xuat_hien;

    public CountProduct() {
    }

    public CountProduct(int product_id, int so_lan_xuat_hien) {
        this.product_id = product_id;
        this.so_lan_xuat_hien = so_lan_xuat_hien;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getSo_lan_xuat_hien() {
        return so_lan_xuat_hien;
    }

    public void setSo_lan_xuat_hien(int so_lan_xuat_hien) {
        this.so_lan_xuat_hien = so_lan_xuat_hien;
    }
    
    
    
}
