<%-- 
    Document   : prijava
    Created on : Sep 5, 2021, 7:19:18 PM
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
            .polje{

                margin-left: 350px;
                margin-right: 350px;
                margin-top: 20px;

            }
            #dugme{

                margin-top: 30px;
            }
        </style>     
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div id="sredina" class="col-xl-6 bg-secondary rounded container rounded" align="center">
            <form action="prijava">
                <h2 id="naslov">Unesite Vaše podatke za prijavu</h2>
                <table>
                    <tr>
                        <td><input class="polje" required type="text" placeholder="E mail" name="email"/></td>
                    </tr>
                    <tr>
                        <td><input class="polje" required type="password" placeholder="Lozinka" name="lozinka"/></td>
                    </tr>
                </table>
                <button id="dugme" type="submit" class="btn btn-success btn-lg">Prijavi se</button>
            </form>
        </div>

    </body>
</html>
