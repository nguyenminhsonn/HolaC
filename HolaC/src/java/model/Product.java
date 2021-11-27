package model;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author admin
 */
public class Product implements Serializable{
    private String code, name, img, info;
    private int quantity;
    private int firstPrice, secondPrice, id_Pro;
    private SecondMenu idSecond;

    public Product() {
    }

    public Product(String code, String name, String img, String info, int quantity, int firstPrice, int secondPrice, int id_Pro, SecondMenu idSecond) {
        this.code = code;
        this.name = name;
        this.img = img;
        this.info = info;
        this.quantity = quantity;
        this.firstPrice = firstPrice;
        this.secondPrice = secondPrice;
        this.id_Pro = id_Pro;
        this.idSecond = idSecond;
    }

    public int getId_Pro() {
        return id_Pro;
    }

    public void setId_Pro(int id_Pro) {
        this.id_Pro = id_Pro;
    }
    
    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getFirstPrice() {
        return firstPrice;
    }

    public void setFirstPrice(int firstPrice) {
        this.firstPrice = firstPrice;
    }

    public int getSecondPrice() {
        return secondPrice;
    }

    public void setSecondPrice(int secondPrice) {
        this.secondPrice = secondPrice;
    }

    public SecondMenu getIdSecond() {
        return idSecond;
    }

    public void setIdSecond(SecondMenu idSecond) {
        this.idSecond = idSecond;
    }

    @Override
    public String toString() {
        return "Product{" + "code=" + code + ", name=" + name + ", img=" + img + ", info=" + info + ", quantity=" + quantity + ", firstPrice=" + firstPrice + ", secondPrice=" + secondPrice + ", id_Pro=" + id_Pro + ", idSecond=" + idSecond + '}';
    }

    

    @Override
    public int hashCode() {
        int hash = 3;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Product other = (Product) obj;
        if (this.quantity != other.quantity) {
            return false;
        }
        if (this.firstPrice != other.firstPrice) {
            return false;
        }
        if (this.secondPrice != other.secondPrice) {
            return false;
        }
        if (this.id_Pro != other.id_Pro) {
            return false;
        }
        if (!Objects.equals(this.code, other.code)) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.img, other.img)) {
            return false;
        }
        if (!Objects.equals(this.info, other.info)) {
            return false;
        }
        if (!Objects.equals(this.idSecond, other.idSecond)) {
            return false;
        }
        return true;
    }

    
}
