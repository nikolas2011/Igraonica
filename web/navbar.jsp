<%-- 
    Document   : navbar
    Created on : Sep 5, 2021, 7:08:38 PM
    Author     : Nikola
--%>

<%@page import="bean.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navbar</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background: #1c1c1c"> 

            <ul class="navbar-nav mr-auto mt-lg-0">
                <%
                    Korisnik korisnik = (Korisnik) request.getSession().getAttribute("k");

                    if (korisnik == null) {
                %>
                <li class="nav-item">
                    <form action="listaIgraonica" method="post">
                        <button type="submit" class="btn btn-secondary btn-md ml-3">Pregled igraonica </button>
                    </form> 
                </li>
                <li class="nav-item">
                    <a href="Registracija.jsp" class="btn btn-secondary btn-md ml-3">Registracija</a>
                </li>
                <li class="nav-item">
                    <a href="prijava.jsp" class="btn btn-secondary btn-md ml-3">Prijava</a>
                </li>
                <%} else if (korisnik.getTipKorisnika().equals("Korisnik")) {%>

                <li class="nav-item">
                    <form action="listaIgraonica" method="post">
                        <button type="submit" class="btn btn-secondary btn-md ml-3">Pregled igraonica </button>
                    </form> 
                </li>
                <li class="nav-item"> 
                    <form action="rezervacija" method="post">
                        <input type="hidden" name="sifra" value="<%=korisnik.getIdKorisnika()%>">
                        <button type="submit" class="btn btn-secondary btn-md ml-3">Rezervacije</button>
                    </form>
                </li>
                <li class="nav-item">
                    <a href="odjava" class="btn btn-danger btn-md ml-3">Odjavi se</a>
                </li>

                <% } else if (korisnik.getTipKorisnika().equals("Administrator")) {
                %>
                <li class="nav-item">
                    <form action="listaIgraonica" method="post">
                        <button type="submit"class="btn btn-secondary btn-md ml-3" >Pregled igraonica </button>

                    </form> 
                </li>
                <li class="nav-item"> <form action="rezervacije" method="post">

                        <button type="submit" class="btn btn-secondary btn-md ml-3">Pregled rezervacije</button>

                    </form></li>

                <li class="nav-item">
                    <a href="odjava" class="btn btn-danger btn-md ml-3">Odjavi se</a>
                </li>
                <%} else if (korisnik.getTipKorisnika().equals("Menadzer")) {%> 
                <li class="nav-item">
                    <form action="listaIgraonica" method="post">
                        <button type="submit"class="btn btn-secondary btn-md ml-3" >Pregled igraonica </button>

                    </form> 
                </li>
                <li class="nav-item"> 
                    <form action="rezervacije" method="post">

                        <button type="submit" class="btn btn-secondary btn-md ml-3">Pregled rezervacije</button>

                    </form></li>

                <li class="nav-item">
                    <a href="odjava" class="btn btn-danger btn-md ml-3">Odjavi se</a>
                </li>
                <% }%>

            </ul>
        </nav>
    </body>
</html>
