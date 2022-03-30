package servleti;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dodajRezervaciju extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String datum = request.getParameter("datum");
        String vreme = request.getParameter("vreme");
        String tipProslave = request.getParameter("tipProslave");
        String cena = request.getParameter("cena");
        String idKorisnika = request.getParameter("idKorisnika");
        String idTermina = request.getParameter("idTermina");
        String Izmena = "ne";
        int Cena = Integer.parseInt(cena);
        int IdKorisnika = Integer.parseInt(idKorisnika);
        int IdTermina = Integer.parseInt(idTermina);
        
        String dbUrl = "jdbc:mysql://localhost:3306/ns";
        String user = "root";
        String pass = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);
            
            String upit = "INSERT INTO rezervacija(datumOdrzavanja, vremeOdrzavanja, tipProslave, cena, idKorisnika, idTermina) VALUES (?,?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(upit);
            
            ps.setString(1, datum);
            ps.setString(2, vreme);
            ps.setString(3, tipProslave);
            ps.setInt(4, Cena);
            ps.setInt(5,IdKorisnika);
            ps.setInt(6, IdTermina);
            
            String izmena = "UPDATE termin SET slobodno = ? WHERE idTermina = '"+IdTermina+"'";
            PreparedStatement ps2 = con.prepareStatement(izmena);
            ps2.setString(1, Izmena);
            
            try{
                ps.executeUpdate();
                ps2.executeUpdate();
            }catch(Exception e){
                request.setAttribute("poruka", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            
            request.setAttribute("uspeh", "Napravili ste rezervaciju");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
            ps.close();
            con.close();
        }catch(ClassNotFoundException | SQLException e){
            request.setAttribute("poruka", e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
