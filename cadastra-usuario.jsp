<%@page language="java" import="java.sql.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%

    String nomeUsuario = request.getParameter("nome");
    String senhaUsuario = request.getParameter("senha");
    String emailUsuario = request.getParameter("email");
    String enderecoUsuario = request.getParameter("endereco");
    Integer numero = Integer.parseInt( request.getParameter("numero") );
    String cep = request.getParameter("cep");
    String bairro = request.getParameter("bairro");
    String cidade = request.getParameter("cidade");
    String datatxt = request.getParameter("nascimento");
    String cpf = request.getParameter("cpf");

    // convertendo data Str -> Date

    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
    java.sql.Date dataNasc = new java.sql.Date( formato.parse(datatxt).getTime() );

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
    String sql = "INSERT INTO usuarios (nome, senha, email, endereco, numero, cep, bairro, cidade, dataNasc, cpf) VALUE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.setString(1, nomeUsuario);
    stm.setString(2, senhaUsuario);
    stm.setString(3, emailUsuario);
    stm.setString(4, enderecoUsuario);
    stm.setInt(5, numero);
    stm.setString(6, cep);
    stm.setString(7, bairro);
    stm.setString(8, cidade);
    stm.setDate(9, dataNasc);
    stm.setString(10, cpf);

    stm.execute() ;
    stm.close() ;

    String sqlSelect = "SELECT * FROM usuarios WHERE nome='" + nomeUsuario + "' AND senha='" + senhaUsuario + "' AND cpf='" + cpf + "';";

    PreparedStatement stmSelect = conexao.prepareStatement(sqlSelect);

    ResultSet dadosUsuario = stmSelect.executeQuery();

    dadosUsuario.next();


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/compra.css">
    <title>  </title>
</head>
<body>
    <main>
        <section>
            <div id="espaco-msg">
                <h1> Casa Bela </h1>
                <h2> Parábens sua Contas foi registrada </h1> 
                <div id="espaco-emotes"> 🥳 🎉 </div>
                <p> Comece a navegar agora mesmo! </p>
                <% out.print("<div id='espaco-links-compra'> <a href='index.jsp?idCliente=" + dadosUsuario.getInt("idCliente") + "'> Entrar </a> </div>"); %>
            </div>
        </section>
    </main>
</body>
</html>