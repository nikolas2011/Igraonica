package servleti;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class registracija extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String telefon = request.getParameter("telefon");
        String email = request.getParameter("email");
        String lozinka = request.getParameter("lozinka");
        String potvrda = request.getParameter("potvrda");
        String tipKorisnika = "Korisnik";

        String dbUrl = "jdbc:mysql://localhost:3306/ns";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);
            Statement st = con.createStatement();
            ResultSet rs = null;
            String upit = "SELECT email, lozinka FROM korisnik";
            rs = st.executeQuery(upit);

            while (rs.next()) {
                if (email.equals(rs.getString("email"))) {
                    request.setAttribute("msg", "Korisničko ime je već u upotrebi. Pokušajte da izaberete drugo.");
                    request.getRequestDispatcher("Registracija.jsp").forward(request, response);
                }
            }
            st.close();
            con.close();

        } catch (ClassNotFoundException e) {
            request.setAttribute("greska", e.getMessage());
            request.getRequestDispatcher("Registracija.jsp").forward(request, response);
        } catch (SQLException se) {
            String poruka = se.getMessage();
            request.setAttribute("greska", poruka);
            request.getRequestDispatcher("Registracija.jsp").forward(request, response);
        }

        if (email != null && email.length() > 0 && lozinka != null && lozinka.length() > 0 && potvrda != null && potvrda.length()>0) {
            if (lozinka.equals(potvrda)) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(dbUrl, user, pass);
                    String upit = "INSERT INTO korisnik(ime,prezime,email,telefon,lozinka,tipKorisnika) VALUES (?,?,?,?,?,?)";

                    PreparedStatement ps = con.prepareStatement(upit);
                    ps.setString(1, ime);
                    ps.setString(2, prezime);
                    ps.setString(3, email);
                    ps.setString(4, telefon);
                    ps.setString(5, lozinka);
                    ps.setString(6, tipKorisnika);

                    try {
                        ps.executeUpdate();
                    } catch (SQLException e) {
                        String poruka = e.getMessage();
                        request.setAttribute("greska", poruka);
                        request.getRequestDispatcher("Registracija.jsp").forward(request, response);
                    }
                    request.setAttribute("msg", "Uspesno ste se registrovali. Unesite vaše podatke da bi ste se prijavili.");
                    request.getRequestDispatcher("prijava.jsp").forward(request, response);
                    ps.close();
                    con.close();
                } catch (ClassNotFoundException se) {

                } catch (Exception e) {
                    String poruka = e.getMessage();
                    request.setAttribute("greska", poruka);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("msg", "Lozinke se ne poklapaju!");
                request.getRequestDispatcher("Registracija.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Morate popuniti sva polja!");
            request.getRequestDispatcher("Registracija.jsp").forward(request, response);
        }
    }
}