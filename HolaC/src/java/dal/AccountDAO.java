package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Customer;

/**
 *
 * @author admin
 */
public class AccountDAO extends DBContext {

    public Account check(String username, String password) {
        String sql = "select * from account where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString("username"), rs.getString("password"), rs.getInt("Role"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkUser(String username) {
        String sql = "select * from account where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public int create(Account a) {
        String sql = "insert into account values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setInt(3, a.getRole());
            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int addCustomerInfo(Customer a) {
        String sql = "insert into customers values(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getName());
            st.setString(3, a.getEmail());
            st.setString(4, a.getPhone());
            st.setString(5, a.getAddress());
            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Customer getCustomerInfo(Account a) {
        String sql = "select c.CustomerName, c.Email, c.Phone, c.Address "
                + "from Account a inner join Customers c "
                + "on (a.Username=c.Username) where a.Username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Customer(a.getUsername(), rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

//    public static void main(String[] args) {
//        AccountDAO a = new AccountDAO();
//        System.out.println(a.getCustomerInfo(new Account("mai", "123", 0)));
//    }
}
