<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.domain.web.Database"%>
<%@page import="com.domain.web.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String error = null;
    double soma = 0;
    try {
        if (request.getParameter("btn_adicionar_espeto") != null) {
            String nome_prato = null;
            String preco_prato = null;
            Statement s = Database.getConnection().createStatement();
            Pedido vs = new Pedido();
            int bd = Integer.parseInt(request.getParameter("id_espeto"));
            ResultSet rs = s.executeQuery("SELECT * FROM cardapio WHERE id_prato= " + bd + " ");
            while (rs.next()) {
                nome_prato = rs.getString("nm_prato");
                preco_prato = rs.getString("vl_valor");
            }
            vs.setCd(request.getParameter("id_espeto"));
            vs.setQt(Integer.parseInt(request.getParameter("qt_espeto")));
            vs.setNm(nome_prato);
            vs.setPreco(Double.parseDouble(preco_prato));
            vs.setTotal(Double.parseDouble(preco_prato) * Integer.parseInt(request.getParameter("qt_espeto")));
            Pedido.getlist().add(vs);
            response.sendRedirect(request.getRequestURI());
        }
    } catch (Exception e) {
      error = e.getMessage();
    }
    if (request.getParameter("btn_excluir_produto") != null) {
        int i = Integer.parseInt(request.getParameter("index"));
        Pedido vs = new Pedido();
        Pedido.getlist().remove(i);
    }
    
    if(request.getParameter("btn_enviar_pedido") != null){
                Pedido vs = new Pedido();
                 
               int i = Pedido.getlist().size();
               for(int j = 0; j<i; j++){
                   soma = soma + Pedido.getlist().get(j).getTotal();
               }
      Pedido.getlist().clear();
        }
    
if(error != null){
 %>       
    <div style="color: red;text-align: center"><%=error%></div>
<%}%>

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
    <center>
        <br>
        <%if(request.getParameter("btn_enviar_pedido") == null){%>
        <form>
            <h4 style="color: white;">Adicionar Espeto - Bebida</h4> 
            <b style="color: white;">Código Espeto/Bebida:</b> <input type="number" name="id_espeto">
            &nbsp; <b style="color: white;">Quantidade:</b> <input type="number" name="qt_espeto"> 
            &nbsp; <input class="btn btn btn-outline-light my-2 my-sm-0" type="submit"  name="btn_adicionar_espeto" value="Confirmar">
            <br><br>
            <h2 style="color: white;">Histórico de Pedidos</h2>
            <%}%>
            <center>
                <table border="2" style="text-align: center; color:white;" bordercolor="white">
                    <%if(request.getParameter("btn_enviar_pedido") == null){%>
                    <tr>
                        <th bgcolor="white" style="color: black;"> Mesa </th>
                        <th bgcolor="white" style="color: black;"> Código </th>
                        <th bgcolor="white" style="color: black;"> Descrição </th> 
                        <th bgcolor="white" style="color: black;"> Quantidade </th> 
                        <th bgcolor="white" style="color: black;"> Preço Unit </th>
                        <th bgcolor="white" style="color: black;"> Total </th>
                        <th bgcolor="white" style="color: black;"> - </th>
                    </tr>
                    <%}%>
                    <%for (Pedido vs : Pedido.getlist()) {%>
                    <tr>
                        <td> <%= session.getAttribute("Mesa")%>  </td>
                        <td> <%= vs.getCd()%>  </td>
                        <td> <%= vs.getNm()%> </td>
                        <td> <%= vs.getQt()%> </td> 
                        <td> <%= vs.getPreco()%> </td>
                        <td> <%= vs.getTotal()%> </td>
                        <%int i = 0;%>

                    <input type="hidden" name="index" value="<%=i++%>">
                    <td><input class="btn btn btn-outline-light my-2 my-sm-0" type="submit" name="btn_excluir_produto" value="Excluir"></td>

                    </tr>
                    <%}%>
                </table>
                <%if(request.getParameter("btn_enviar_pedido") != null){%>
                <h4 style="color:red">Mesa </h4>   
                <h4 style="color:red"><%= session.getAttribute("Mesa")%></h4>  
                <h4 style="color:red">Total a Pagar </h4>   
                <h4 style="color:red">R$ <%= soma%></h4> 

                <%}%>
            </center>
            <br>
            <input class="btn btn btn-outline-light my-2 my-sm-0"type="submit" name="btn_enviar_pedido" value="Finalizar Pedido">
            &nbsp; <a class="btn btn btn-outline-light my-2 my-sm-0" href="PesquisarMesa.jsp">Voltar a Busca</a>    
        </form>
    </center>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>
