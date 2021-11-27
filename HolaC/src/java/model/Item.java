package model;

import java.io.Serializable;
import java.text.DecimalFormat;

/**
 *
 * @author admin
 */

public class Item implements Serializable {
    private Product product;
    private int quantity;
    private float price;
    
    DecimalFormat df = new DecimalFormat("#.00");

    public Item() {
    }

    public Item(Product product, int quantity, float price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public DecimalFormat getDf() {
        return df;
    }

    public void setDf(DecimalFormat df) {
        this.df = df;
    }

    @Override
    public String toString() {
        return "Item{" + "product=" + product + ", quantity=" + quantity + ", price=" + price + ", df=" + df + '}';
    }
    
    
    
}
