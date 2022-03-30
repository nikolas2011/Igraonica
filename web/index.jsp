<%-- 
    Document   : index
    Created on : Sep 5, 2021, 5:41:36 PM
    Author     : Nikola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pocetna strana</title>
        <style>
            body{
                background-image: url(Slike/5.jpg);
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
            .container{
                margin-top: 100px;
                background-color: gainsboro;
                color: white;
                font-size: 20px;
                padding: 60px;
                text-align: center;
            }
            #naslov{
                margin-bottom: 30px;
            }

        </style>
    </head>
    <body>

        <div class="container rounded">
            <%@include file="navbar.jsp" %>

            <%
                String msg = (String) request.getAttribute("uspeh");
                if (msg != null) {
            %>
            <%= msg%>
            <% }%>
            <h1 id="naslov">Dobro dosli na sajt igraonice NS</h1>


            <form action="listaIgraonica" method="post">
                <button type="submit" class="btn-lg btn-info" >Pregled igraonica </button>
            </form> 

        </div>
    </body>
</html>
