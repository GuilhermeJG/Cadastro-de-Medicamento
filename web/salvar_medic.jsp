<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"; content="text/html"; charset="utf-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
// inserir Variáveis 
            String nome, compos;
            int id, quant;
//Receber dados digitados
            id = Integer.parseInt(request.getParameter("id"));
            nome = request.getParameter("nome");
            compos = request.getParameter("composicao");
            quant = Integer.parseInt(request.getParameter("quantidade"));

            
            try {
//Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco_medicamento", "root", "18753GJjesus");
                //Inserir os dados na tabela produto do banco de dados aberto
                st = conecta.prepareStatement("INSERT INTO medicamento VALUES(?,?,?,?)");
                st.setInt(1, id);
                st.setString(2, nome);
                st.setString(3, compos);
                st.setInt(4, quant);
                st.executeUpdate(); //Executa o comando INSERT
                out.print("<p style='color:white; font-size:25px; font-family:arial' >Medicamento cadastrado com sucesso!!</p>");
            } catch (Exception x) { //variável X vai receber os erros
            String erro = x.getLocalizedMessage(); //O erro armazenado na variável X vai pra varável erro 
                if(erro.contains("Duplicate entry")){//se erro contido for= "Duplicate entrt" print("Este ID ja está em uso")
                out.print("<p style='color:black; font-size:30px; font-family:arial' >ID inserido ja está em uso </p>");
            }else {
            out.print(" Mensagem de erro:" + x.getMessage());
            }
            }
        %>
    </body>
</html>