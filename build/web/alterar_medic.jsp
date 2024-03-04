<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alterar medicamento</title>
    </head>
    <body>
        <!-- Dados do carregamedic vai ser recebido aqui -->

        <%
// inserir Variáveis 
            String nome, compos;
            int id, quant;
//Receber dados digitados
            id = Integer.parseInt(request.getParameter("id"));
            nome = request.getParameter("nome");
            compos = request.getParameter("composicao");
            quant = Integer.parseInt(request.getParameter("quantidade"));

//Conexão com banco, o nome do pacote e a "Localização do banco com senha e usuário"
            try {
//Fazer a conexão com o Banco de Dados           
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco_medicamento", "root", "18753GJjesus");
 //Alterar o sdados na tabela produtos do BD
                PreparedStatement st = conecta.prepareStatement("UPDATE medicamento SET Nome = ?, Compisicao = ?, Quantidade = ? WHERE id_medic = ?");
                st.setString(1, nome);
                st.setString(2, compos);
                st.setInt(3, quant);
                st.setInt(4, id);
                st.executeUpdate(); //Executa o UPDATE
                out.print("<p style='color:white; font-size:25px; font-family:arial' > Os dados do medicamento com ID " + id + " foram alterados com sucesso!! </p>");
            } catch (Exception erro) {
                out.print("<p style='color:black; font-size:25px; font-family:arial' > Entre em contato com o suporte e informe o erro </p>" + erro.getMessage());
            }

        %>
    </body>
</html>
