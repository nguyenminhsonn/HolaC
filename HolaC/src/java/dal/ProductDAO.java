package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.FirstMenu;
import model.Product;
import model.SecondMenu;

/**
 *
 * @author admin
 */
public class ProductDAO extends DBContext {

    public List<Product> getProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.*, s.brand, s.id_firstMenu, f.Categorize from Product p \n"
                + "inner join SecondMenu s on s.id_secondMenu = p.id_secondMenu \n"
                + "inner join FirstMenu f on f.id_firstMenu = s.id_firstMenu\n"
                + "where 1=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("ProductName"));
                p.setImg(rs.getString("ProductImage"));
                p.setInfo(rs.getString("Information"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setFirstPrice(rs.getInt("FirstPrice"));
                p.setSecondPrice(rs.getInt("SecondPrice"));
                p.setId_Pro(rs.getInt("Id_Pro"));
                FirstMenu f = new FirstMenu(rs.getInt("id_firstMenu"), rs.getString("Categorize"));
                SecondMenu s = new SecondMenu(rs.getInt("id_secondMenu"), rs.getString("brand"), f);

                p.setIdSecond(s);
                list.add(p);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByPage(List<Product> list, int start, int end) {
        List<Product> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(list.get(i));
        }
        return t;
    }

    public List<FirstMenu> getCategorize() {
        List<FirstMenu> list = new ArrayList<>();
        String sql = "select * from FirstMenu";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                FirstMenu f = new FirstMenu(rs.getInt("id_firstMenu"), rs.getString("Categorize"));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<SecondMenu> getBrand() {
        List<SecondMenu> list = new ArrayList<>();
        String sql = "select s.id_secondMenu, s.brand, s.id_firstMenu, f.Categorize  \n"
                + "from SecondMenu s inner join FirstMenu f on f.id_firstMenu = s.id_firstMenu";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                FirstMenu f = new FirstMenu(rs.getInt("id_firstMenu"), rs.getString("Categorize"));
                SecondMenu s = new SecondMenu(rs.getInt("id_secondMenu"), rs.getString("brand"), f);
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductsById(String code) {
        String sql = "select p.*, s.brand, s.id_firstMenu, f.Categorize from Product p \n"
                + "inner join SecondMenu s on s.id_secondMenu = p.id_secondMenu \n"
                + "inner join FirstMenu f on f.id_firstMenu = s.id_firstMenu\n"
                + "where p.code = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("ProductName"));
                p.setImg(rs.getString("ProductImage"));
                p.setInfo(rs.getString("Information"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setFirstPrice(rs.getInt("FirstPrice"));
                p.setSecondPrice(rs.getInt("SecondPrice"));
                p.setId_Pro(rs.getInt("Id_Pro"));
                FirstMenu f = new FirstMenu(rs.getInt("id_firstMenu"), rs.getString("Categorize"));
                SecondMenu s = new SecondMenu(rs.getInt("id_secondMenu"), rs.getString("brand"), f);

                p.setIdSecond(s);
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public int getNumberOfCate() {
        String sql = "select COUNT(*) as num from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getNewPro() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 8 p.* , s.brand, s.id_firstMenu, f.Categorize from Product p\n"
                + "inner join SecondMenu s on s.id_secondMenu = p.id_secondMenu\n"
                + "inner join FirstMenu f on f.id_firstMenu = s.id_firstMenu\n"
                + "order by id_Pro desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("ProductName"));
                p.setImg(rs.getString("ProductImage"));
                p.setInfo(rs.getString("Information"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setFirstPrice(rs.getInt("FirstPrice"));
                p.setSecondPrice(rs.getInt("SecondPrice"));
                p.setId_Pro(rs.getInt("Id_Pro"));
                FirstMenu f = new FirstMenu(rs.getInt("id_firstMenu"), rs.getString("Categorize"));
                SecondMenu s = new SecondMenu(rs.getInt("id_secondMenu"), rs.getString("brand"), f);
                p.setIdSecond(s);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getOldPro() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 8 p.* , s.brand, s.id_firstMenu, f.Categorize from Product p\n"
                + "inner join SecondMenu s on s.id_secondMenu = p.id_secondMenu\n"
                + "inner join FirstMenu f on f.id_firstMenu = s.id_firstMenu\n"
                + "order by id_Pro";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("ProductName"));
                p.setImg(rs.getString("ProductImage"));
                p.setInfo(rs.getString("Information"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setFirstPrice(rs.getInt("FirstPrice"));
                p.setSecondPrice(rs.getInt("SecondPrice"));
                p.setId_Pro(rs.getInt("Id_Pro"));
                FirstMenu f = new FirstMenu(rs.getInt("id_firstMenu"), rs.getString("Categorize"));
                SecondMenu s = new SecondMenu(rs.getInt("id_secondMenu"), rs.getString("brand"), f);
                p.setIdSecond(s);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByFid(String fid) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.*, s.brand, s.id_firstMenu, f.Categorize from Product p \n"
                + "inner join SecondMenu s on s.id_secondMenu = p.id_secondMenu \n"
                + "inner join FirstMenu f on f.id_firstMenu = s.id_firstMenu\n"
                + "where f.id_FirstMenu =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("ProductName"));
                p.setImg(rs.getString("ProductImage"));
                p.setInfo(rs.getString("Information"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setFirstPrice(rs.getInt("FirstPrice"));
                p.setSecondPrice(rs.getInt("SecondPrice"));
                p.setId_Pro(rs.getInt("Id_Pro"));
                FirstMenu f = new FirstMenu(rs.getInt("id_firstMenu"), rs.getString("Categorize"));
                SecondMenu s = new SecondMenu(rs.getInt("id_secondMenu"), rs.getString("brand"), f);
                p.setIdSecond(s);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductBySid(String sid) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.*, s.brand, s.id_firstMenu, f.Categorize from Product p \n"
                + "inner join SecondMenu s on s.id_secondMenu = p.id_secondMenu \n"
                + "inner join FirstMenu f on f.id_firstMenu = s.id_firstMenu\n"
                + "where s.brand =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, sid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("ProductName"));
                p.setImg(rs.getString("ProductImage"));
                p.setInfo(rs.getString("Information"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setFirstPrice(rs.getInt("FirstPrice"));
                p.setSecondPrice(rs.getInt("SecondPrice"));
                p.setId_Pro(rs.getInt("Id_Pro"));
                FirstMenu f = new FirstMenu(rs.getInt("id_firstMenu"), rs.getString("Categorize"));
                SecondMenu s = new SecondMenu(rs.getInt("id_secondMenu"), rs.getString("brand"), f);
                p.setIdSecond(s);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.*, s.brand, s.id_firstMenu, f.Categorize from Product p\n"
                + "inner join SecondMenu s on s.id_secondMenu = p.id_secondMenu\n"
                + "inner join FirstMenu f on f.id_firstMenu = s.id_firstMenu\n"
                + "where p.ProductName like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("ProductName"));
                p.setImg(rs.getString("ProductImage"));
                p.setInfo(rs.getString("Information"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setFirstPrice(rs.getInt("FirstPrice"));
                p.setSecondPrice(rs.getInt("SecondPrice"));
                p.setId_Pro(rs.getInt("Id_Pro"));
                FirstMenu f = new FirstMenu(rs.getInt("id_firstMenu"), rs.getString("Categorize"));
                SecondMenu s = new SecondMenu(rs.getInt("id_secondMenu"), rs.getString("brand"), f);
                p.setIdSecond(s);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deletePro(String code) {
        String sql = "delete from product where code = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getBid(int cid, String brand) {
        ProductDAO pDAO = new ProductDAO();
        List<SecondMenu> listB = pDAO.getBrand();
        for (SecondMenu s : listB) {
            if(s.getIdFirst().getId() == cid && s.getBrand().contains(brand)){
               return s.getId();
            }
        }
        return 0;
    }

    public void insertPro(String code, String name, String img, String info, int quantity, int fprice, int cid, String bid) throws Exception {
        String sql = "insert into product values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.setString(2, name);
            st.setString(3, "./img/" + img);
            st.setString(4, info);
            st.setInt(5, quantity);
            st.setInt(6, fprice);
            st.setString(7, null);
            ProductDAO p = new ProductDAO();
            st.setInt(8, p.getBid(cid, bid));
            st.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Violation of PRIMARY KEY constraint");
        }
    }
    
    public void editPro (String code, String name, String img, String info, int quantity, int fprice, int sprice, int cid, String bid) {
        String sql = "update product set ProductName=?, ProductImage=?, Information=?, Quantity=?, FirstPrice=?, SecondPrice=?, id_secondMenu=? "
                + " where code=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, "./img/" + img);
            st.setString(3, info);
            st.setInt(4, quantity);
            st.setInt(5, fprice);
            st.setInt(6, sprice);
            ProductDAO p = new ProductDAO();
            st.setInt(7, p.getBid(cid, bid));
            st.setString(8, code);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        ProductDAO pDAO = new ProductDAO();
        System.out.println(pDAO.getNumberOfCate());
    }
}
