
import dal.ProductDAO;
import java.util.ArrayList;
import java.util.List;
import model.FirstMenu;
import model.Product;
import model.SecondMenu;
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
public class ProductDAOTest {
    ProductDAO pDAO = new ProductDAO();
    
    //getProducts
    @Test
    public void testGetProductsReturnsGoodResult() {
        List<Product> actual = pDAO.getProducts();
        
        assertEquals(60, actual.size());
        assertEquals("CAAV033", actual.get(0).getCode());
        assertEquals("MELO140", actual.get(38).getCode());
    }
    
    //getCategorize
    @Test
    public void testGetCategorizeReturnsGoodResult() {
        List<FirstMenu> expected = new ArrayList<>();
        expected.add(new FirstMenu(1, "LAPTOP"));
        expected.add(new FirstMenu(2, "PC"));
        expected.add(new FirstMenu(3, "Monitor"));
        expected.add(new FirstMenu(4, "Headphone"));
        expected.add(new FirstMenu(5, "Camera"));
        expected.add(new FirstMenu(6, "Chair"));
        expected.add(new FirstMenu(7, "Mouse"));
        expected.add(new FirstMenu(8, "Keyboard"));
        List<FirstMenu> actual = pDAO.getCategorize();
        assertEquals(expected, actual);
    }
    
    //getBrand
    @Test
    public void testGetBrandReturnsGoodResult() {
        List<SecondMenu> actual = pDAO.getBrand();
        assertEquals(28, actual.size());
        
        assertEquals("MSI", actual.get(0).getBrand());
        assertEquals("NEWMEN", actual.get(23).getBrand());
    }
    
    //getProductsById
    @Test
    public void testGetProductsByIdGivenRightArgumentReturnsGoodResult() {
        Product expected = new Product("KBED019", "E-Dra EK308 RGB", "./img/KBED019.png", "The Corsair K100 RGB is the pinnacle of Corsair keyboards, offering the cutting-edge performance, style, durability, and customization that gamers need to stand above the rest", 100, 999000, 899000, 16, new SecondMenu(27, "E-DRA", new FirstMenu(8, "Keyboard")));
        Product actual = pDAO.getProductsById("KBED019");
        assertEquals(expected, actual);
    }
    
    @Test
    public void testGetProductsByIdGivenWrongArgumentReturnsBadResult() {
        Product expected = null;
        Product actual = pDAO.getProductsById("ABCD123");
        assertEquals(expected, actual);
    }
    
    //getNewPro
    public void testGetNewProReturnsGoodResult() {
        List<Product> actual = pDAO.getNewPro();
        
        assertEquals(8, actual.size());
        assertEquals(60, actual.get(0).getId_Pro());
        assertEquals(59, actual.get(1).getId_Pro());
    }
    
    //getOldPro
    public void testGetOldProReturnsGoodResult() {
        List<Product> actual = pDAO.getOldPro();
        
        assertEquals(8, actual.size());
        assertEquals(1, actual.get(0).getId_Pro());
        assertEquals(2, actual.get(1).getId_Pro());
    }
    
    //getProductByFid
    @Test
    public void testGetProductByFidGivenRightArgumentReturnsGoodResult() {
        List<Product> actual = pDAO.getProductByFid("1");
        assertEquals(21, actual.size());
        assertEquals("LAPTOP", actual.get(0).getIdSecond().getIdFirst().getName());
    }
    
    @Test
    public void testGetProductByFidGivenWrongArgumentReturnsBadResult() {
        List<Product> actual = pDAO.getProductByFid("0");
        assertEquals(0, actual.size());
    }
    
    //getProductBySid
    @Test
    public void testGetProductBySidGivenRightArgumentReturnsGoodResult() {
        List<Product> actual = pDAO.getProductBySid("MSI");
        assertEquals(7, actual.size());
        assertEquals("MSI", actual.get(0).getIdSecond().getBrand());
    }
    
    @Test
    public void testGetProductBySidGivenWrongArgumentReturnsBadResult() {
        List<Product> actual = pDAO.getProductByFid("ABCD");
        assertEquals(0, actual.size());
    }
    
    //getProductByName
    @Test
    public void testGetProductByNameGivenRightArgumentReturnsGoodResult() {
        List<Product> expected = new ArrayList<>();
        expected.add(new Product("LTMS337", "Laptop MSI Gaming GF75 Thin 10SCSR (208VN)", "./img/LTMS337.png", "Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.", 100, 27989000, 25489000, 33, new SecondMenu(1, "MSI", new FirstMenu(1, "LAPTOP"))));
        expected.add(new Product("LTMS361", "Laptop MSI Gaming Bravo 17 A4DDR (200VN)", "./img/LTMS361.png", "Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.", 100, 24989000, 24489000, 34, new SecondMenu(1, "MSI", new FirstMenu(1, "LAPTOP"))));
        expected.add(new Product("LTMS364", "Laptop MSI Modern 14 B11MO (010VN)", "./img/LTMS364.png", "Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.", 100, 21989000, 21689000, 35, new SecondMenu(1, "MSI", new FirstMenu(1, "LAPTOP"))));
        List<Product> actual = pDAO.getProductByName("Laptop MSI");
        assertEquals(expected, actual);
    }
    
    @Test
    public void testGetProductByNameGivenWrongArgumentReturnsBadResult() {
        List<Product> expected = new ArrayList<>();
        List<Product> actual = pDAO.getProductByName("ABCD");
        assertEquals(expected, actual);
    }
    
    //insertPro
    @Test
    public void testInsertProGivenRightArgumentReturnsGoodResult() throws Exception {
        pDAO.insertPro("BCDA123", "BAC", "CAAV033.png", "Changed", 1, 1000, 5, "AVTECH");
        Product expected = new Product("BCDA123", "BAC", "./img/CAAV033.png", "Changed", 1, 1000, 0, 78, new SecondMenu(17, "AVTECH", new FirstMenu(5, "Camera")));
        Product actual = pDAO.getProductsById("BCDA123");
        assertEquals(expected, actual);
    }
    
    @Test (expected = Exception.class)
    public void testiInsertProGivenWrongArgumentReturnsBadResult() throws Exception{
        pDAO.insertPro("CAAV033", "BAC", "./img/CAAV033.png", "Changed", 1, 1000, 5, "AVTECH");
    }
    
    //deleteProduct
    @Test
    public void testDeleteProGivenRightArgumentReturnsGoodResult() {
        pDAO.deletePro("BCDA123");
        Product expected = null;
        Product actual = pDAO.getProductsById("BCDA123");
        assertEquals(expected, actual);
    }
    
    //editProduct
    @Test
    public void testEditProductGivenRightArgumentReturnsGoodResult() throws Exception {
        pDAO.editPro("PCGM246", "PC Asus bruh", "PCGM246.png", "A good PC", 24, 10000, 5000, 2, "ASUS");
        String expected = "PC Asus bruh";
        String actual = pDAO.getProductsById("PCGM246").getName();
        assertEquals(expected, actual);
    }
    
    //getNumberOfCate
    @Test
    public void testGetNumberOfCateGivenRightArgumentReturnsGoodResult() {
        int actual = pDAO.getNumberOfCate();
        assertEquals(60, actual);
    }
    
}
