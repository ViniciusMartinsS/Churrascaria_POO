<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getParameter("btn_entrar_pedido") != null) {
        session.setAttribute("Mesa", request.getParameter("id_mesa"));
        response.sendRedirect(request.getContextPath() + "/RetirarOrdem.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Realizar Pedido</title>
    </head>
    <body background="http://1.bp.blogspot.com/-hPTt-K4vL1s/VhswvXNtugI/AAAAAAAAAXo/TluQCvDJyjA/s1600/tumblr_static_background.jpg">
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h3 style="color:grey; text-align: center;">Realizar Pedido</h3>
    <center><br>
        <form>

            <table border="0">
                <tr>
                    <th style="color:white;">Número mesa: &nbsp;</th>
                    <th><input type="number" name="id_mesa"><th>
                </tr>
            </table>

            <br>
            &emsp;&emsp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;<input class="btn btn btn-outline-light my-2 my-sm-0" type="submit" name="btn_entrar_pedido" value="Confirmar">
            &emsp;&ensp;&ensp;<INPUT class="btn btn-outline-light my-2 my-sm-0"type="reset"  name="b2" value="Limpar">
        </form>
    </center>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>
