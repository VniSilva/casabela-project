<%@page language="java" import="java.sql.*" %>

<%
    String idCliente = request.getParameter("id_cliente");
    Integer id_pedido = Integer.parseInt(request.getParameter("id_pedido"));

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
    String sqlSelectPedidos = "SELECT * FROM pedidos WHERE id_pedido=" + id_pedido + ";";

    PreparedStatement stmSelectPedidos = conexao.prepareStatement(sqlSelectPedidos);

    ResultSet dadosPedidos = stmSelectPedidos.executeQuery();

    dadosPedidos.next();

    Integer id_produto = dadosPedidos.getInt("id_produto");

    String sqlSelectProduto = "SELECT qtd FROM produtos WHERE id_produto=" + id_produto + ";";

    PreparedStatement stmSelectProduto = conexao.prepareStatement(sqlSelectProduto);

    ResultSet dadosProduto = stmSelectProduto.executeQuery();

    dadosProduto.next();

    Integer qtdProduto = dadosProduto.getInt("qtd");

    String sqlUpdate = "UPDATE produtos SET qtd=? WHERE id_produto=" + id_produto;

    PreparedStatement stmUpdate = conexao.prepareStatement(sqlUpdate);

    Integer novaQtd = qtdProduto + 1;

    stmUpdate.setInt(1, novaQtd);

    stmUpdate.execute();
    stmUpdate.close();

    String sql = "DELETE FROM pedidos WHERE id_pedido=" + id_pedido + ";";
    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.execute();
    stm.close();

    response.sendRedirect("carrinho.jsp?idCliente=" + idCliente);
%>