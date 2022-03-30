package servleti;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dodajIgraonicu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String naziv = request.getParameter("naziv");
        String adresa = request.getParameter("adresa");
       

        String dbUrl = "jdbc:mysql://localhost:3306/ns";
        String user = "root";
        String pass = "";

       

        if (naziv != null && naziv.length() > 0
                
                && adresa != null && adresa.length() > 0
               ) 
        {
            try{
              
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl, user, pass);
                String upitNovi = "INSERT INTO igraonica(nazivIgraonice, adresaIgraonice) VALUES (?,?)";
                
                PreparedStatement ps = con.prepareStatement(upitNovi);
                ps.setString(1, naziv);
                ps.setString(2, adresa);
               
                
                try{
                    ps.executeUpdate();
                }
                catch(SQLException e){
                    request.setAttribute("greska", e.getMessage());
                    request.getRequestDispatcher("dodajIgraonicu.jsp").forward(request, response);
                }
                
                request.setAttribute("uspeh", "Uspešno ste dodali novu igraonicu.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                
                ps.close();
                con.close();
            }catch(ClassNotFoundException | SQLException e){
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("dodajIgraonicu.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("msg", "Morate popuniti sva polja!");
            request.getRequestDispatcher("dodajIgraonicu.jsp").forward(request, response);
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
