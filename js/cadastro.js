function resetarCor(id){
    var campoId = id;
    document.getElementById(campoId).style.border = "1px solid #858585";

    if(campoId == "nome"){
        alertaId = "alerta-nome";
        document.getElementById(alertaId).style.display = 'none';
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "confirma-senha"){
        alertaId = "alerta-confirma-senha";
        document.getElementById(alertaId).style.display = "none";
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "senha"){
        alertaId = "alerta-senha";
        document.getElementById(alertaId).style.display = "none";
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "email"){
        alertaId = "alerta-email";
        document.getElementById(alertaId).style.display = "none";
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "nascimento"){
        alertaId = "alerta-nascimento";
        document.getElementById(alertaId).style.display = "none";
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "endereco"){
        alertaId = "alerta-endereco";
        document.getElementById(alertaId).style.display = 'none';
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "numero"){
        alertaId = "alerta-numero";
        document.getElementById(alertaId).style.display = 'none';
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "complemento"){
        alertaId = "alerta-complemento";
        document.getElementById(alertaId).style.display = 'none';
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "bairro"){
        alertaId = "alerta-bairro";
        document.getElementById(alertaId).style.display = 'none';
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "cidade"){
        alertaId = "alerta-cidade";
        document.getElementById(alertaId).style.display = 'none';
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "estado"){
        alertaId = "alerta-estado";
        document.getElementById(alertaId).style.display = 'none';
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "cep"){
        alertaId = "alerta-cep";
        document.getElementById(alertaId).style.display = 'none';
        document.getElementById(campoId).style.marginLeft = "0px";
    }
    if(campoId == "cpf"){
        alertaId = "alerta-cpf";
        document.getElementById(alertaId).style.display = 'none';
        document.getElementById(campoId).style.marginLeft = "0px";
    }
}


function validaDados(){
    var nome = document.getElementById("nome").value;
    var senha = document.getElementById("senha").value;
    var confirmaSenha = document.getElementById("confirma-senha").value;
    var email = document.getElementById("email").value;
    var nascimento = document.getElementById("nascimento").value;
    var endereco = document.getElementById("endereco").value;
    var numero = document.getElementById("numero").value;
    var complemento = document.getElementById("complemento").value;
    var bairro = document.getElementById("bairro").value;
    var estado = document.getElementById("estado").value;
    var cidade = document.getElementById("cidade").value;
    var cpf = document.getElementById("cpf").value;
    var cep = document.getElementById("cep").value;

    if(nome && senha && confirmaSenha && email && nascimento && endereco && numero && complemento && bairro && estado && cidade && cpf && cep){
        if(senha != confirmaSenha){
            window.alert('Senhas diferentes');
            var campoId = "senha";
            var campoId2 = "confirma-senha";
            var alertaId = "alerta-senha";
            var alertaId2 = "alerta-confirma-senha";
            document.getElementById(campoId).style.border = "1px solid red";
            document.getElementById(campoId2).style.border = "1px solid red";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId2).style.marginLeft = "36px";
            document.getElementById(alertaId2).style.display = "flex";
        }else{
            if(cep.length != 8){
                
                window.alert("Cep invalido\nUtilize somente números");
                var campoId = "cep";
                var alertaId = "alerta-cep";
                document.getElementById(campoId).style.border = "1px solid red";
                document.getElementById(campoId).style.marginLeft = "36px";
                document.getElementById(alertaId).style.display = "flex";
            }
            else{
                if(cpf.length != 11){
                window.alert("CPF invalido\nTente usar somente números");
                var campoId = "cpf";
                var alertaId = "alerta-cpf";
                document.getElementById(campoId).style.border = "1px solid red";
                document.getElementById(campoId).style.marginLeft = "36px";
                document.getElementById(alertaId).style.display = "flex";
                }
                else{
                    confirmacao = window.confirm('Tem certeza que deseja continuar?');
                    if(confirmacao){
                        window.location = "cadastra-usuario.jsp?nome=" + nome + "&senha=" + senha + "&email=" + email + "&endereco=" + endereco + "&numero=" + numero + "&cep=" + cep + "&bairro=" + bairro + "&cidade=" + cidade + "&nascimento=" + nascimento + "&cpf=" + cpf;
                    }
                }
            }
        }
            
        
        
    }else{
    
        window.alert('Preencha todos os campos');
        if(nome == ""){
            var campoId = "nome";
            var alertaId = "alerta-nome";
            document.getElementById(campoId).style.border = "1px solid red";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(alertaId).style.display = "flex";
        }else{
            var campoId = "nome";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(senha == ""){
            var campoId = "senha";
            var alertaId = "alerta-senha";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "senha";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(confirmaSenha == ""){
            var campoId = "confirma-senha";
            var alertaId = "alerta-confirma-senha";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "confirma-senha";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(email == ""){
            var campoId = "email";
            var alertaId = "alerta-email";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "email";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(nascimento == ""){
            var campoId = "nascimento";
            var alertaId = "alerta-nascimento";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "nascimento";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(endereco == ""){
            var campoId = "endereco";
            var alertaId = "alerta-endereco";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "endereco";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(numero == ""){
            var campoId = "numero";
            var alertaId = "alerta-numero";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "numero";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(complemento == ""){
            var campoId = "complemento";
            var alertaId = "alerta-complemento";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "complemento";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(bairro == ""){
            var campoId = "bairro";
            var alertaId = "alerta-bairro";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "bairro";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(estado == ""){
            var campoId = "estado";
            var alertaId = "alerta-estado";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "estado";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(cidade == ""){
            var campoId = "cidade";
            var alertaId = "alerta-cidade";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "cidade";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(cpf == ""){
            var campoId = "cpf";
            var alertaId = "alerta-cpf";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "cpf";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
        if(cep == ""){
            var campoId = "cep";
            var alertaId = "alerta-cep";
            document.getElementById(alertaId).style.display = "flex";
            document.getElementById(campoId).style.marginLeft = "36px";
            document.getElementById(campoId).style.border = "1px solid red";
        }else{
            var campoId = "cep";
            document.getElementById(campoId).style.border = "1px solid #00FF00";
        }
    }
}