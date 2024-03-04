<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alteração de medicamento</title>
    </head>
    <body>

        <%
//Variával
            int id;
            id = Integer.parseInt(request.getParameter("id"));

//Conexão com banco, o nome do pacote e a "Localização do banco com senha e usuário"
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco_medicamento", "root", "18753GJjesus");

//Funçao sql pra buscar medicamento no banco pelo ID
            PreparedStatement st = conecta.prepareStatement("SELECT * FROM medicamento WHERE id_medic=?");
            st.setInt(1, id); //complete o ? com o conteúdo da variável id

//Executa o comando "SELECT * FROM medicamento WHERE id_medic=?" e guarda em RESULTADO
            ResultSet resultado = st.executeQuery(); //Usado pra executar comando select "buscar informações"  no banco

            if (!resultado.next()) { //Se a variável "resultado" ! "não" tiver próxima linha..
                out.print("Este medicamento não foi encontrado");
            } else {  //Se receber um id recebe o form

//Fechar o código java pra colocar HTML sem fechar o else
        %>  

        <form method="post" action="alterar_medic.jsp">
            <p>
                <label for="id">ID:</label>
                <input type="number" name="id" id="id" value="<%= resultado.getString("id_medic")%>" readonly >
            </p>
            <p>
                <label for="nome">Nome do Medicamento:</label>
                <input type="text" name="nome" id="nome" size="35" maxlength="100" value="<%= resultado.getString("Nome")%>" >
            </p>  
            <p>
                <label for="compos">Composição:</label>
                <input type="text" name="composicao" id="compos" size="35" maxlength="100" value="<%= resultado.getString("Compisicao")%>"  >
            </p> 
            <p>
                <label for="quant">Quantidade</label>
                <input type="number" name="quantidade" id="quant" value="<%= resultado.getString("Quantidade")%>"  >
            </p>              
            <p>
                <input type="submit" value="Salvar alteração">   
            </p>

        </form> 

        <%
//Fechar o Java e o else com o html dentro
            }
        %>



    </body>
</html>
