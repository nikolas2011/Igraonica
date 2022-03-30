package servleti;

import java.sql.*;
import bean.Igraonica;
import java.util.ArrayList;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class listaIgraonica extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        ArrayList<Igraonica> listaIgraonica = new ArrayList<>();
        String dbUrl = "jdbc:mysql://localhost:3306/ns";
        String user = "root";
        String pass = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);
            Statement stmt = con.createStatement();
            
            String upit = "SELECT * FROM igraonica";
            
            ResultSet rs = stmt.executeQuery(upit);
            
            while(rs.next()){
                listaIgraonica.add(new Igraonica(rs.getInt("idIgraonice"), rs.getString("nazivIgraonice"), rs.getString("adresaIgraonice")));
            }
            
            request.setAttribute("igraonice", listaIgraonica);
            request.getRequestDispatcher("listaIgraonica.jsp").forward(request, response);
            
            rs.close();
            stmt.close();
            con.close();
        }catch(IOException | ClassNotFoundException | SQLException | ServletException e){
            request.setAttribute("greska", e.getMessage());
            request.getRequestDispatcher("listaIgraonica.jsp").forward(request, response);
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