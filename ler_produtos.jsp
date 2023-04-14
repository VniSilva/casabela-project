<%@page language="java" import="java.sql.*" %>

<%

 // variaveis para o banco de dados
    String banco    = "bd_casabela";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root" ;
    String senha    = "" ;

    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver );

    //cria a variavel para conectar com o banco
    Connection conexao ;
    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql com o comando de Inserir
    String sql = "SELECT * FROM produtos" ;

    PreparedStatement stm = conexao.prepareStatement(sql);

    ResultSet dados = stm.executeQuery(); 


    out.print("<section id='sessao_produtos'>");
    while( dados.next() )
    {
        out.print("<div id='no-margin-left' class='caixa_produto'>");
            out.print("<div class='imagem_produto' style='background-image: url(img/" + dados.getString("imagem") + "); background-size: cover; background-position: center center;'> </div> ");
            out.print("<div class='informacoes_produto'>");
                out.print("<p>");
                    out.print( dados.getString("nome") );
                out.print("</p>");
                out.print("<p style='margin-bottom: 30px;'>");
                    out.print("R$ " + dados.getString("preco"));
                out.print("</p>");
                out.print("<a href='produto.html?id_produto='" + dados.getInt("id_produto") + "'>");
                out.print("Comprar");
                out.print("</a>");
            out.print("</div>");
        out.print("</div>");
    }
    out.print("</section>");
%>