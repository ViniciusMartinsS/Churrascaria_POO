<%@page import="com.domain.web.Cardapio"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.domain.web.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try {
        if (request.getParameter("excluir") != null) {
            int i = Integer.parseInt(request.getParameter("index"));
            Statement st = Database.getConnection().createStatement();
            st.execute("delete from cardapio where id_prato = '" + i + "'");
            response.sendRedirect(request.getRequestURI());
        }
    } catch (Exception e) {

    }

    if (request.getParameter("editar") != null) {
        int i = Integer.parseInt(request.getParameter("index"));
        session.setAttribute("index", i);
        response.sendRedirect("EditarManterEspeto.jsp");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Cardápio - Boi no Espeto</title>
    </head>
    <body background="http://1.bp.blogspot.com/-hPTt-K4vL1s/VhswvXNtugI/AAAAAAAAAXo/TluQCvDJyjA/s1600/tumblr_static_background.jpg">
        <%@include file="WEB-INF/jspf/header.jspf" %>  
        <h3 style="color:grey; text-align: center;">Nosso Cardápio</h3> 
        </br>
    <center>
        <table border="2"class="table" style="text-align: center; color:white;" bordercolor="white">
            <tr>
                <%if (session.getAttribute("me.login") != null) {%>
                <th bgcolor="white" style="color: black;"> Código </th>
                    <%}%>
                <th bgcolor="white" style="color: black;"> Espeto </th>
                <th bgcolor="white" style="color: black;">  Descrição </th>
                <th bgcolor="white" style="color: black;">  Preço </th>
                    <%if (session.getAttribute("me.login") != null) {%>
                <th bgcolor="white" style="color: black;">  - </th>
                <th bgcolor="white" style="color: black;">  - </th>
                    <%}%>
            </tr>
            <%try {%>
            <%for (Cardapio vs : Cardapio.getList()) {%>
            <tr>
                <%if (session.getAttribute("me.login") != null) {%>
                <td><%= vs.getId()%></td>
                <%}%>
                <td><%= vs.getNome()%></td>
                <td><%= vs.getDesc()%></td>
                <td><%= vs.getValor()%>,00</td>
                <%if (session.getAttribute("me.login") != null) {%>
            <form>
                <% String i = vs.getId();%>
                <input type="hidden" name="index" value="<%= i%>">
                <td> <input class="btn btn btn-outline-light my-2 my-sm-0" type="submit" name="excluir" value="Excluir"> </td>
                <td> <input class="btn btn btn-outline-light my-2 my-sm-0" type="submit" name="editar" value="Editar"> </td>
            </form>
            <%}%>
            </tr>
            <%}%>
            <%} catch (Exception e) {%>
            <div style="color: red;"><%=e.getMessage()%></div>
            <%}%>
        </table>
    </center>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>
