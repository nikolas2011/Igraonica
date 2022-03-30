package servleti;

import bean.Igraonica;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class igraonica extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String id = request.getParameter("sifra");
        int idIgraonice = Integer.parseInt(id);
        
        String dbUrl = "jdbc:mysql://localhost:3306/ns";
        String user = "root";
        String pass = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection kon = DriverManager.getConnection(dbUrl, user, pass);
            Statement stmt = kon.createStatement();
            
            String upit = "SELECT * FROM igraonica WHERE idIgraonice = '"+idIgraonice+"'";
            
            ResultSet rs = stmt.executeQuery(upit);
            
            if(rs.next()){
                Igraonica igraonica = new Igraonica(idIgraonice, rs.getString("nazivIgraonice"), rs.getString("adresaIgraonice"));
                
                request.setAttribute("igraonica", igraonica);
                request.getRequestDispatcher("igraonica.jsp").forward(request, response);
            }
            
            rs.close();
            stmt.close();
            kon.close();
        }catch(IOException | ClassNotFoundException | SQLException | ServletException e){
            request.setAttribute("poruka", e.getMessage());
            request.getRequestDispatcher("igraonica.jsp").forward(request, response);
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
        processRequest(request, response);
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