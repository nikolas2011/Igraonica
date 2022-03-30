<%-- 
    Document   : rezervacije
    Created on : Sep 5, 2021, 8:45:43 PM
    Author     : Nikola
--%>

<%@page import="bean.Rezervacija"%>
<%@page import="java.util.ArrayList"%>

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
                background-color: gray;
                color: white;
                font-size: 20px;
                padding: 60px;
                text-align: center;

            }

        </style>         
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <%
            ArrayList<Rezervacija> rezervacije = (ArrayList<Rezervacija>) request.getAttribute("rezervacije");

            for (Rezervacija r : rezervacije) {

        %>



        <div id="opis" class="col-md-8 container rounded">
            <p><b>Datum odrzavanja <%=r.getDatum()%></b></p>
            <p><b>Vreme odrzavanja: </b><%=r.getVreme()%></p>
            <p><b>Tip proslave: </b><%=r.getTipProslave()%></p>
            <p><b>Cena: </b><%=r.getCena()%></p>
            <p><b>ID Termina: </b><%=r.getIdTermina()%></p>
            <%
                if (korisnik == null) {

                } else if (korisnik.getTipKorisnika().equals("Menadzer")) {
                } else if (korisnik.getTipKorisnika().equals("Administrator")) {
                } else if (korisnik.getTipKorisnika().equals("Korisnik")) {

            %>

            <form action="ukloniRezervaciju" metohod="post">
                <button type="submit" class="btn-md btn-danger">Otkazi rezervaciju</button>
                <input type="hidden" name="sifra" value="<%=r.getIdRezervacije()%>"> 
            </form>

        </div>
        <% }
            }
        %>
    </body>
</html>
