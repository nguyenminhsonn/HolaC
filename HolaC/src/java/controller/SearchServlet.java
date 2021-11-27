package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FirstMenu;
import model.Product;
import model.SecondMenu;

/**
 *
 * @author admin
 */
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        ProductDAO pDAO = new ProductDAO();
        List<FirstMenu> listC = pDAO.getCategorize();
        List<SecondMenu> listB = pDAO.getBrand();

        for (int i = 0; i < listB.size(); i++) {
            for (int j = 0; j < listB.size(); j++) {
                if (listB.get(i).getBrand().compareTo(listB.get(j).getBrand()) == 0 && i != j) {
                    listB.remove(i);
                }
            }
        }
        for (int k = 0; k < listB.size(); k++) {
            listB.get(k).setId(k + 1);
        }
        
        List<Product> raw_listP = pDAO.getProductByName(txtSearch);
        int size = raw_listP.size();
        int numperPage = 9;
        int numPage = size / numperPage + (size % numperPage == 0 ? 0 : 1);
        String spage = request.getParameter("page");
        int page;
        if (spage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(spage);
        }
        int start, end;
        start = (page - 1) * numperPage;
        end = Math.min(size, page * numperPage);
        List<Product> listP = pDAO.getProductByPage(raw_listP, start, end);
        
        
        request.setAttribute("dataC", listC);
        request.setAttribute("dataB", listB);
        request.setAttribute("dataP", listP);
        request.setAttribute("page", page);
        request.setAttribute("num", numPage);
        request.setAttribute("txt", txtSearch);
        request.getRequestDispatcher("categories.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
