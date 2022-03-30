package servleti;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dodajTermin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String datum = request.getParameter("datum");
        String vreme = request.getParameter("vreme");
        String cena = request.getParameter("cena");
        String tipProslave = request.getParameter("tipProslave");
        String Slobodno = "da";
        String sifra = request.getParameter("sifra");
        int Sifra = Integer.parseInt(sifra);
        int Cena = Integer.parseInt(cena);

        String dbUrl = "jdbc:mysql://localhost:3306/ns";
        String user = "root";
        String pass = "";

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);
            String upit = "INSERT INTO termin(datum,vreme,tipProslave,cena,slobodno,idIgraonice) VALUES (?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(upit);
            ps.setString(1, datum);
            ps.setString(2, vreme);
            ps.setString(3, tipProslave);
            ps.setInt(4, Cena);
            ps.setString(5, Slobodno);
            ps.setInt(6, Sifra);

            try {
                ps.executeUpdate();
            } catch (SQLException e) {
                request.setAttribute("msg", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            request.setAttribute("uspeh", "Uspešno ste dodali novi termin.");
            request.getRequestDispatcher("index.jsp").forward(request, response);

            ps.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("greska", e.getMessage());
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
