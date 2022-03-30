<%-- 
    Document   : listaIgraonica
    Created on : Sep 5, 2021, 5:58:56 PM
    Author     : Nikola
--%>

<%@page import="java.util.ArrayList"%>
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
                background-color: gray;
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

        </style>         

    </head>
    <body>

        <%@include file="navbar.jsp" %>
        <div class="container rounded">
            <h1 id="naslov">Igraonice</h1>
            <%
                if (korisnik == null) {
                } else if (korisnik.getTipKorisnika().equals("Korisnik")) {
                } else if (korisnik.getTipKorisnika().equals("Menadzer")) {
                } else if (korisnik.getTipKorisnika().equals("Administrator")) {
            %>
            <a href="dodajIgraonicu.jsp">
                <button type="submit"class="btn-md btn-secondary">Dodaj igraonicu</button>

            </a> 

            <%
                } %>

            <div class="row">

                <%  ArrayList<Igraonica> igraonice = (ArrayList<Igraonica>) request.getAttribute("igraonice");

                    for (Igraonica i : igraonice) {

                %>
                <div class="col-md-4 rounded">
                    <h3 id="naslov"><b>Naziv igraonice <%=i.getNazivIgraonice()%></b></h3>
                    <p><b>Adresa igraonice: </b><%=i.getAdresaIgraonice()%></p>
                    <form action="igraonica" method="post">
                        <button type="submit" class="btn-md btn-info">Detalji</button>
                        <input type="hidden" name="sifra" value="<%=i.getIdIgraonice()%>">
                    </form>
                    <%
                        if (korisnik == null) {
                        } else if (korisnik.getTipKorisnika().equals("Korisnik")) {
                        } else if (korisnik.getTipKorisnika().equals("Menadzer")) {
                        } else if (korisnik.getTipKorisnika().equals("Administrator")) {
                    %>

                    <form action="ukloniIgraonicu" method="post">
                        <input type="hidden" name="sifra" value="<%=i.getIdIgraonice()%>">   
                        <button type="submit" class="btn-md btn-danger">Ukloni igraonicu</button>
                    </form>

                    <% } %>
                </div>
                <% }%>
            </div>
        </div>
    </body>
</html>
