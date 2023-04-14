<%@page language="java" import="java.sql.*" %>

<%

    String nomeUsuario = request.getParameter("nome");
    String senhaUsuario = request.getParameter("senha");

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
    String sql = "SELECT * FROM usuarios WHERE nome='" + nomeUsuario + "' and senha='" + senhaUsuario + "';";

    PreparedStatement stm = conexao.prepareStatement(sql);

    ResultSet dados = stm.executeQuery(); 

    if(dados.next()){
        response.sendRedirect("index.jsp?idCliente=" + dados.getInt("idCliente"));
    }else{
        response.sendRedirect("login.jsp?naoEncontrado=True");
    }

%>