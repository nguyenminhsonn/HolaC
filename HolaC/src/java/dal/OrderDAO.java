package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;
import model.Item;
import model.Order;

/**
 *
 * @author admin
 */

public class OrderDAO extends DBContext {

    DecimalFormat df = new DecimalFormat("#.00");

    public void addOrder(Order order, Cart cart) throws Exception{
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            //add vào bang Order
            String sql = "INSERT INTO dbo.[Order] VALUES (?,?,?,ROUND(?, 2),ROUND(?, 2),ROUND(?, 2),?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order.getOdate());
            st.setString(2, order.getSdate());
            st.setString(3, order.getUsername());
            st.setFloat(4, Float.parseFloat(df.format(order.getPayment())));
            st.setFloat(5, Float.parseFloat(df.format(order.getShipping())));
            st.setFloat(6, Float.parseFloat(df.format(order.getPayment() + order.getShipping())));
            st.setInt(7, order.getStatus());
            st.executeQuery();
        } catch (SQLException ex) {
            throw new SQLException("Error");
        }

        try {
            //lay ra id cua Order vua add
            String sql1 = "SELECT TOP 1 order_id FROM dbo.[Order] ORDER BY order_id DESC";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add vào bang OrderDetail
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    try {
                        String sql2 = "INSERT INTO dbo.orderDetails VALUES (?,?,ROUND(?, 2),?,ROUND(?, 2))";
                        PreparedStatement st2 = connection.prepareStatement(sql2);
                        st2.setInt(1, oid);
                        st2.setString(2, i.getProduct().getCode());
                        st2.setFloat(4, Float.parseFloat(df.format(i.getPrice())));
                        st2.setInt(5, i.getQuantity());
                        st2.setFloat(6, Float.parseFloat(df.format(i.getQuantity() * i.getPrice())));
                        st2.executeUpdate();
                    } catch (SQLException e) {
                        System.out.println(e);
                    }
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Error");
        }

//        //update so luong trong bang Product sau khi ban
//        String sql3 = "update storage set num_left = num_left - ? where kitID =  ? and size = ?";
//        for (Item i : cart.getItems()) {
//            try {
//                PreparedStatement st3 = connection.prepareStatement(sql3);
//                st3.setInt(1, i.getQuantity());
//                st3.setString(2, i.getKit().getKitID());
//                st3.setString(3, i.getSize());
//                st3.executeUpdate();
//            } catch (SQLException ex) {
//                throw new SQLException("Error");
//            }
//        }
    }

    public int updateConfirm(int oid, int status) throws Exception{
        String sql;
        if (status == 0) {
            sql = "UPDATE dbo.[Order] SET status = ?, shipDate = DATEADD(day, 5, orderDate) WHERE order_id = ?";
        } else {
            sql = "UPDATE dbo.[Order] SET status = ?, shipDate = GETDATE() WHERE order_id = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, oid);
            return st.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error");
        }
    }

    public int getOrderNum(String username) {
        int orderNum = 0;
        String sql = "SELECT Username, COUNT(order_id) AS orderNum FROM dbo.[Order] WHERE username = ? AND MONTH(orderDate) = MONTH(GETDATE()) GROUP BY username";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                orderNum = rs.getInt(2);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return orderNum;
    }

    public Order getOrderByID(int oid) {
        Order o = new Order();
        String sql = "SELECT * FROM dbo.[Order] WHERE order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                o.setOid(rs.getInt(1));
                o.setOdate(rs.getString(2));
                o.setSdate(rs.getString(3));
                o.setUsername(rs.getString(4));
                o.setPayment(rs.getFloat(5));
                o.setShipping(rs.getFloat(6));
                o.setTotal(rs.getFloat(7));
                o.setStatus(rs.getInt(8));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return o;
    }

    public List<Order> getAllOrder(String username) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.[Order] ";
        if (username != "") {
            sql = sql.concat(" WHERE Username = '" + username + "' ");
        }
        sql = sql.concat(" ORDER BY order_id DESC");
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOid(rs.getInt(1));
                o.setOdate(rs.getString(2));
                o.setSdate(rs.getString(3));
                o.setUsername(username);
                o.setPayment(rs.getFloat(5));
                o.setShipping(rs.getFloat(6));
                o.setTotal(rs.getFloat(7));
                o.setStatus(rs.getInt(8));
                list.add(o);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Item> getDetails(int oid) {
        List<Item> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.orderDetails WHERE order_id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Item i = new Item();
                ProductDAO pdb = new ProductDAO();
                i.setProduct(pdb.getProductsById(rs.getString(2)));
                i.setPrice(rs.getFloat(4));
                i.setQuantity(rs.getInt(3));
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Map<String, Integer> getMostBuy(String username) {
        Map<String, Integer> most = new HashMap<>();
        String sql = "SELECT TOP 1 code, SUM(quantity) AS num_of_bought\n" +
"                FROM dbo.[Order] INNER JOIN dbo.orderDetails ON orderDetails.order_id = dbo.[Order].order_id\n" +
"                WHERE username = 'mai' GROUP BY code ORDER BY num_of_bought DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                most.put(rs.getString(1), rs.getInt(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return most;
    }
}
