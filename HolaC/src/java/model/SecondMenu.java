package model;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author admin
 */
public class SecondMenu implements Serializable{
    private int id;
    private String brand;
    private FirstMenu idFirst;

    public SecondMenu() {
    }

    public SecondMenu(int id, String brand, FirstMenu idFirst) {
        this.id = id;
        this.brand = brand;
        this.idFirst = idFirst;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public FirstMenu getIdFirst() {
        return idFirst;
    }

    public void setIdFirst(FirstMenu idFirst) {
        this.idFirst = idFirst;
    }

    @Override
    public String toString() {
        return "SecondMenu{" + "id=" + id + ", brand=" + brand + ", idFirst=" + idFirst + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
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
        final SecondMenu other = (SecondMenu) obj;
        if (this.id != other.id) {
            return false;
        }
        if (!Objects.equals(this.brand, other.brand)) {
            return false;
        }
        if (!Objects.equals(this.idFirst, other.idFirst)) {
            return false;
        }
        return true;
    }
    
    
}
