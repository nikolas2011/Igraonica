<%-- 
    Document   : igraonica
    Created on : Sep 5, 2021, 6:27:13 PM
    Author     : Nikola
--%>
<%@page import="java.sql.*" %>
<%@page import="bean.Termin"%>
<%@page import="bean.Igraonica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-image: url(Slike/5.jpg);
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
            .container{

                margin-top: 100px;
                background-color: threedface;
                color: white;
                font-size: 20px;
                padding: 60px;
                text-align: center;

            }
            .row{
                width: 110%;
                padding-top: 30px;
                padding-bottom: 30px;
                padding-left: 200px;


            }
            .col-md-4{
                background-color: cornflowerblue;
                margin: 10px;
                height: 200px;
                padding: 20px;
                margin-left: 10px;
                margin-right: 10px;
                width: 100px;


            }
            #dugme{

                margin-top: 30px;
            }
            #tekst{
                margin-top: 50px;
            }

        </style>         
    </head>
    <body>

        <%@include file="navbar.jsp" %>

        <div class="container rounded">
            <%
                Igraonica i = (Igraonica) request.getAttribute("igraonica");
            %>
            <div id="opis">
                <h3 id="naslov"><b>Naziv igraonice: <%=i.getNazivIgraonice()%></b></h3>
                <p><b>Adresa igraonice: </b><%=i.getAdresaIgraonice()%></p>


            </div>

            <%
                
                if (korisnik == null ) { %>
                <p>Da bi ste rezervisali termin, potrebno je prijaviti se.</p>
                <% } else if (korisnik.getTipKorisnika().equals("Korisnik")) {
                } else if (korisnik.getTipKorisnika().equals("Administrator")) {

                } else if (korisnik.getTipKorisnika().equals("Menadzer")) {
            %>
            <form action="proslediTermin" method="post">
                <input type="hidden" name="sifra" value="<%=i.getIdIgraonice()%>">
                <button id="dugme" type="submit">Dodaj termin</button>
            </form>


            <%}%>
            <h4 id="tekst">Slobodni termini:</h4>
            <div class="row">

                <%

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ns", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = null;

                    String upit = "SELECT * FROM termin WHERE idIgraonice = '" + i.getIdIgraonice() + "' AND slobodno = 'da'";

                    try {
                        rs = stmt.executeQuery(upit);

                        while (rs.next()) {
                %>
                <div class="col-md-4 rounded">
                    <h4>Datum: <%=rs.getString("datum")%> </h4>
                    <h4>Vreme <%=rs.getString("vreme")%> </h4>
                    <h4>Cena: <%=rs.getInt("cena")%> </h4>
                    <h4>Tip proslave: <%=rs.getString("tipProslave")%> </h4>
                    <%  if (korisnik == null) { %>
                    <%} else if (korisnik.getTipKorisnika().equals("Administrator")) {%>
                    <%} else if (korisnik.getTipKorisnika().equals("Korisnik")) {%>
                    <form action ="dodajRezervaciju" method="post">
                        <input type="hidden" name="datum" value="<%=rs.getString("datum")%>">
                        <input type="hidden" name="vreme" value="<%=rs.getString("vreme")%>">
                        <input type="hidden" name="tipProslave" value="<%=rs.getString("tipProslave")%>">
                        <input type="hidden" name="cena" value="<%=rs.getInt("cena")%>">
                        <input type="hidden" name="idKorisnika" value="<%=korisnik.getIdKorisnika()%>">
                        <input type="hidden" name="idTermina" value="<%=rs.getInt("idTermina")%>">
                        <button type="submit">Rezervisi</button>
                    </form>
                    <% } else if (korisnik.getTipKorisnika().equals("Menadzer")) {%>
                    <form action="ukloniTermin" method="post">
                        <input type="hidden" name="sifra" value="<%=rs.getInt("idTermina")%>">   
                        <button type="submit">Ukloni termin</button> 
                    </form>


                    <% } %>

                </div>
                <%
                        }
                    } catch (Exception e) {
                        request.setAttribute("poruka", e.getMessage());
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                    rs.close();
                    stmt.close();
                    con.close();

                %>

            </div>
        </div>

    </body>
</html>
