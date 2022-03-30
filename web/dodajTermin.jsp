<%-- 
    Document   : dodajTermin
    Created on : Sep 5, 2021, 10:07:44 PM
    Author     : Nikola
--%>

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
            #dugme{

                margin-top: 20px;
            }

        </style>
    </head>
    <body>

        <%@include file="navbar.jsp" %>
        <div class="container rounded">
            <%
                Igraonica i = (Igraonica) request.getAttribute("igraonica");
            %>
            <form action="dodajTermin" method="post">
                <table align="center">
                    <tr>
                        <td><b>Datum: </b></td>
                        <td><input required type="text" name="datum"></td>

                    </tr><tr>
                        <td><b>Vreme: </b></td>
                        <td><input required type="text" name="vreme"></td>

                    </tr><tr>
                        <td><b>Cena: </b></td>
                        <td><input required type="text" name="cena"></td>

                    </tr><tr>
                        <td><b>Tip proslave </b></td>
                        <td><input required type="text" name="tipProslave"></td>

                    </tr>
                    <input type="hidden" name="sifra" value="<%= i.getIdIgraonice()%>">
                </table>
                <button id="dugme" type="submit" class="btn-md btn-success">Dodaj</button>
            </form>
        </div>
</body>
</html>
