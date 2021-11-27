
import dal.AccountDAO;
import java.sql.SQLException;
import model.Account;
import model.Customer;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class AccountDAOTest {
    
    AccountDAO aDAO = new AccountDAO();
    
    @Test
    public void testCheckGivenRightArgumentReturnsGoodResult() {
        Account expected = new Account("sa", "123", 1);
        Account actual = aDAO.check("sa", "123");
        assertEquals(expected, actual);
    }
    
    @Test
    public void testCheckGivenWrongArgumentReturnsBadResult() {
        Account expected = null;
        Account actual = aDAO.check("sa", "12345");
        assertEquals(expected, actual);
    }
    
//    @Test
//    public void testCreateGivenRightArgumentReturnsGoodResult() {
//        int expected = 1;
//        int actual = aDAO.create(new Account("mai", "123", 0));
//        assertEquals(expected, actual);
//    }
    
    @Test
    public void testCreateGivenWrongArgumentReturnsBadResult() {
        int expected = 0;
        int actual = aDAO.create(new Account("mai", "123", 0));
        assertEquals(expected, actual);
    }
    
//    @Test
//    public void testAddCustomerInfoGivenRightArgumentReturnsGoodResult() {
//        int expected = 1;
//        int actual = aDAO.addCustomerInfo(new Customer("mai", "Nguyen Ngoc Mai", "mai@gmail.com", "0966240301", "Hoa Binh"));
//        assertEquals(expected, actual);
//    }
    
    @Test
    public void testAddCustomerInfoGivenWrongArgumentReturnsBadResult() {
        int expected = 0;
        int actual = aDAO.addCustomerInfo(new Customer("123", "Nguyen Ngoc Mai", "mai@gmail.com", "0966240301", "Hoa Binh"));
        assertEquals(expected, actual);
    }
    
    @Test
    public void testGetCustomerInfoGivenRightArgumentReturnsGoodResult() {
        Customer expected = new Customer("mai", "Nguyen Ngoc Mai", "mai@gmail.com", "0966240301", "Hoa Binh");
        Customer actual = aDAO.getCustomerInfo(new Account("mai", "123", 0));
        assertEquals(expected, actual);
    }
    
    @Test
    public void testGetCustomerInfoGivenWrongArgumentReturnsBadResult() {
        Customer expected = null;
        Customer actual = aDAO.getCustomerInfo(new Account("123", "123", 0));
        assertEquals(expected, actual);
    }
    
    @Test
    public void testCheckUserGivenRightArgumentReturnsGoodResult() {
        boolean expected = true;
        boolean actual = aDAO.checkUser("sa");
        assertEquals(expected, actual);
    }
    
    @Test
    public void testCheckUserGivenWrongArgumentReturnsBadResult() {
        boolean expected = false;
        boolean actual = aDAO.checkUser("son");
        assertEquals(expected, actual);
    }
}
