package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Cart implements Serializable{
    private String username;
    private List<Item> items;

    public Cart(String username) {
        this.username = username;
        this.items = new ArrayList<>();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    // số lượng 1 sản phẩm trong giỏ - khách sẽ mua
    
    public Item getExactItem(String id) {
        for (Item i : items) {
            String code = i.getProduct().getCode();
            if (code.contains(id)) {
                return i;
            }
        }
        return null;
    }
    
    public int getItemQuantity(String id) {
        return getExactItem(id).getQuantity();
    }
    
    // add 1 sản phẩm vào giỏ, nếu có rồi thì tăng số lượng
    public void addItem(Item t) {
        if (getExactItem(t.getProduct().getCode()) != null) {
            Item m = getExactItem(t.getProduct().getCode());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }
    
    //loại sản phẩm khỏi giỏ
    public void removeItem(String id) {
        if (getExactItem(id) != null) {
            items.remove(getExactItem(id));
        }
    }
    
    //tổng tiền của cả giỏ hàng – sẽ add vào bảng Order
    public float getTotalMoney() {
        float t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }
    
}
