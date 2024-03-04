<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"; content="text/html"; charset="utf-8">
        <title>Listagem de produtos</title>

        <style>
            table{
                border-collapse: collapse;
                border: 5px solid white;
                color: white;
                size: 100px;
            }
            th {
                border: 5px solid white; /* Define a cor (#000 é preto) e a largura da borda */
                padding: 10px; /* Adiciona espaçamento interno às células de cabeçalho */
            }
            td {
                border: 5px solid white; /* Define a cor (#888 é cinza) e a largura da borda */
                padding: 10px; /* Adiciona espaçamento interno às células de dados */
            }
        </style>

    </head>
    
    <body>

        <%
//receber name colsult no medicamento da pasta apresenta 
            String con;
            con = request.getParameter("colsult");
            try {
                //Fazer a conexão com o Banco de Dados

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco_medicamento", "root", "18753GJjesus");

//Listar os dados da tabela produto do banco de dados 
                PreparedStatement st = conecta.prepareStatement("SELECT * FROM medicamento WHERE Nome like ?");
                st.setString(1, "%" + con + "%");//Função like do banco dee dados 
                ResultSet inftragtabe = st.executeQuery(); //Usado pra executar comando select "buscar informações  no banco

//sempre importar ResultSet"comando pra receber os dados da tabela inteira"  LINHA A LINHA com comando de repetição
        %>

        <table  class="borda" >
            <tr>
                <!-- Criar a tabela que quero mostrar em HTML. TR= Cabeçario da tabela  TH= coluna  TD= dados da tabela-->
                <th>Id_medicamento</th><th>Nome</th><th>Composição</th><th>Quantidade</th>
            </tr>                
            <%               
               while (inftragtabe.next()) {  // while = Enquanto tiver informações na tabela fazer...
            %>
            <tr>
                <!<!-- exibir %= inftragtabe.getString("id_medic")% "informação que estiver no java" Tudo sting pois só é pra mostrar -->
                <td> <%= inftragtabe.getString("id_medic")%> </td>
                <td> <%= inftragtabe.getString("Nome")%> </td>
                <td> <%= inftragtabe.getString("Compisicao")%> </td>
                <td> <%= inftragtabe.getString("Quantidade")%> </td>
            </tr>
            
            
            <%
                }           
            %> 
            
        </table>
            
        <%//recomeçar código java 

            } catch (Exception x) {
                out.print("Mensagem de erro:" + x.getMessage());
            }
        %>   
    </body>
</html>
