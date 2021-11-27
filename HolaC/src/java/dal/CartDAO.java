package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import model.Cart;
import model.FirstMenu;
import model.Item;
import model.Product;
import model.SecondMenu;

/**
 *
 * @author admin
 */
public class CartDAO extends DBContext {

    DecimalFormat df = new DecimalFormat("#.00");

    public Cart getCart(String username) {

        Cart cart = new Cart(username);
        String sql = "SELECT p.*,s.brand,f.id_firstMenu,f.Categorize,c.* FROM Product p\n"
                + "INNER JOIN SecondMenu s ON s.id_secondMenu = p.id_secondMenu\n"
                + "INNER JOIN FirstMenu f ON f.id_firstMenu = s.id_secondMenu\n"
                + "INNER JOIN dbo.cart c ON p.code = c.code where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(9), new SecondMenu(rs.getInt(8), rs.getString(10), new FirstMenu(rs.getInt(11), rs.getString(12))));
                int quantity = rs.getInt(14);
                float price;
                if (p.getSecondPrice() == 0) {
                    price = p.getFirstPrice();
                } else {
                    price = p.getSecondPrice();
                }
                Item t = new Item(p, quantity, price);
                cart.addItem(t);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cart;
    }

    public void updateCart(Cart cart) {
        String sql1 = "DELETE FROM dbo.cart WHERE username = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, cart.getUsername());
            st1.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
        for (int i = 0; i < cart.getItems().size(); i++) {
            String sql2 = "INSERT INTO dbo.cart VALUES (?,?,?,?,?,ROUND(?, 2),ROUND(?, 2))";
            Item t = cart.getItems().get(i);
            try {
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setString(1, t.getProduct().getImg());
                st2.setInt(2, t.getQuantity());
                st2.setFloat(3, Float.parseFloat(df.format(t.getPrice())) * t.getQuantity());
                st2.setFloat(4, Float.parseFloat(df.format(t.getPrice())));
                st2.setString(5, t.getProduct().getCode());
                st2.setString(6, cart.getUsername());
                st2.executeQuery();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
}
