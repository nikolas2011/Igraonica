<%-- 
    Document   : dodajIgraonicu
    Created on : Sep 5, 2021, 9:35:49 PM
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
                background-color: skyblue;
                color: white;
                font-size: 20px;
                padding: 60px;
                text-align: center;

            }
            #dugme{

                margin-top: 30px;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container rounded">
            <form action="dodajIgraonicu" method="post">
                <table align="center">
                    <tr>
                        <td><b>Naziv igraonice: </b></td>
                        <td><input required type="text" name="naziv"></td>

                    </tr><tr>
                        <td><b>Adresa igraonice </b></td>
                        <td><input required type="text" name="adresa"></td>

                    </tr>
                </table>
                <button id="dugme" type="submit"class="btn-md btn-success " >Dodaj</button>
            </form>
        </div>
    </body>
</html>
