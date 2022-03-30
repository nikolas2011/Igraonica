<%-- 
    Document   : Registracija
    Created on : Sep 5, 2021, 7:11:51 PM
    Author     : Nikola
--%>

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
        <div class="container rounded">
            <form action="registracija" method="post">
                <h3 align="center">Unesite podatke za registraciju</h3>
                <table align="center">
                    <tr>
                        <td align="left"><b>Unesite Vaše ime: </b></td>
                        <td width=""><input required type="text" minlength="3" name="ime"></td>
                    </tr>
                    <tr>
                        <td align="left"><b>Unesite Vaše prezime: </b></td>
                        <td><input required type="text"  minlength="2" name="prezime"></td>
                    </tr>
                    <tr>
                        <td align="left"><b>Unesite Vaš broj telefona: </b></td>
                        <td><input required type="text" placeholder="U formatu 064xxxxxx" minlength="7" name="telefon"></td>
                    </tr>
                    <tr>
                        <td align="left"><b>Unesite Vašu email adresu: </b></td>
                        <td><input required type="text" placeholder="U formatu xxxxx@xxx.com" minlength="8" name="email"></td>
                    </tr>

                    <tr>
                        <td align="left"><b>Unesite željenu lozinku: </b></td>
                        <td><input required type="password" placehodler="Minimum 6 karaktera." minlength="6" name="lozinka"></td>
                    </tr>
                    <tr>
                        <td align="left"><b>Potvrdite željenu lozinku: </b></td>
                        <td><input required type="password" placehodler="Mora se poklapati sa gornjom" minlength="6" name="potvrda"></td>
                    </tr>
                </table>
                <button id="dugme" align="center" type="submit" class="btn btn-success btn-lg">Sačuvaj</button>
        </div>
    </body>
</html>
