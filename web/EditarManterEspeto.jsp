<%@page import="com.domain.web.Cardapio"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.domain.web.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ErrorMessage = null;
    try {
        if (request.getParameter("salvar") != null) {
            int cd = Integer.parseInt(request.getParameter("espeto_cd"));
            double valor = Double.parseDouble(request.getParameter("espeto_valor"));
            String nome = request.getParameter("espeto_nome");
            String desc = request.getParameter("espeto_escricao");
            Statement st = Database.getConnection().createStatement();
            st.executeUpdate("update cardapio set vl_valor = " + valor + " where id_prato = " + session.getAttribute("index") + "");
            st.executeUpdate("update cardapio set nm_prato = '" + nome + "' where id_prato = " + session.getAttribute("index") + "");
            st.executeUpdate("update cardapio set ds_prato = '" + desc + "' where id_prato = " + session.getAttribute("index") + "");

            response.sendRedirect("Cardapio.jsp");
        }
    } catch (Exception e) {
        ErrorMessage = e.getMessage();
    }
    if (ErrorMessage != null) {
%>       
<div style="color: red;text-align: center"><%=ErrorMessage%></div>
<%}%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Editar Espeto - Boi na Brasa</title>
    </head>
    <body background="http://1.bp.blogspot.com/-hPTt-K4vL1s/VhswvXNtugI/AAAAAAAAAXo/TluQCvDJyjA/s1600/tumblr_static_background.jpg">
        <%@include file="WEB-INF/jspf/header.jspf" %>  
        <h3 style="color:grey; text-align: center;">Editar Espeto</h3> 
        <br>
    <center>
        <form >
            <table border="0">
                <tr>
                    <th style="color:white;">Código:</th>
                    <td><input type="text" name="espeto_cd" placeholder="Código Espeto" value="<%= session.getAttribute("index")%>" /></td>         
                </tr>
                <tr>
                    <th style="color:white;">Espeto:</th>
                    <td><input type="text" name="espeto_nome"  placeholder="Espeto" required/></td>  
                </tr>
                <tr>
                    <th style="color:white;">Preço:</th>    
                    <td><input type="text" name="espeto_valor" placeholder="R$" required/></td>
                </tr>
                <tr>
                    <th style="color:white;">Descrição</th>
                    <td><input type="text" name="espeto_escricao" placeholder="Ingredientes"/></td>
                </tr>
            </table>
            <br/>
            &emsp; &emsp; &emsp; &emsp;<input class="btn btn btn-outline-light my-2 my-sm-0" type="submit" name="salvar" value="Salvar">
            &emsp;&emsp;&emsp;&emsp;<INPUT class="btn btn-outline-light my-2 my-sm-0"type="reset"  name="b2" value="Limpar">
        </form>
    </center>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>

