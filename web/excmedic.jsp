<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
        <title>Excluir Medicamento</title>
    </head>

    <body>

        <%
            int id_medic;
            id_medic = Integer.parseInt(request.getParameter("id"));
            try {
//Conecta ao banco de dados chamado banco
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco_medicamento", "root", "18753GJjesus");

// Excluem o produto de código informado
                PreparedStatement st = conecta.prepareStatement("DELETE FROM medicamento WHERE id_medic=?");//id_medic nome da coluna que está no banco de dados
                st.setInt(1, id_medic);
                int resultado = st.executeUpdate(); // Executa o comando DELETE

//Verifica se o produto foi ou  não excluído
                if (resultado == 0) {
                    out.print("<p style='color:black; font-size:25px; font-family:arial' >Este medicamento não está cadastrado</p>");
                } else {
                    out.print("<p style='color:white; font-size:30px; font-family:arial' >O medicamento com ID " + id_medic + " foi excluído com sucesso!!</p>");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("<p style='color:black; font-size:25px; font-family:arial' >Entre em contato com o suporte e informe o erro </p> " + mensagemErro);
            }

        %>

    </body>
</html>
