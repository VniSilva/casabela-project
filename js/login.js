function validaLogin(){
    var nome = document.getElementById("nome").value;
    var senha = document.getElementById("senha").value;

    if(senha == "" || nome == ""){
        window.alert("Preencha todos os campos");
    }
        if(senha == ""){
            document.getElementById("senha").style.border = "1px solid red";
            document.getElementById("alerta-senha").style.display = "flex";
            document.getElementById("senha").style.marginLeft = "36px";
        }
        if(nome == ""){
            document.getElementById("nome").style.border = "1px solid red";
            document.getElementById("alerta-nome").style.display = "flex";
            document.getElementById("nome").style.marginLeft = "36px";
        }
}