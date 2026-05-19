document.addEventListener("DOMContentLoaded", () => {
    const tabela = document.getElementById("tabela-saida");
    const cabeca = document.getElementById("tabela-cabeca")
    const selecao = document.getElementById("filtro");

    selecao.addEventListener("input", async () => {
        let valor = selecao.value;
        cabeca.innerHTML = "";
        tabela.innerHTML = "";

        if (valor == 0) {
            return
        } else if (valor == 1) {
            cabeca.innerHTML = "<tr><th>Título</th><th>Leitor</th><th>Data de Emprestimo</th></tr>";
        }
        else if (valor == 2) {
            cabeca.innerHTML = "<tr><th>Leitor Atrasado</th><th>Número do Leitor</th><th>Livro Atarasado</th><th>Data de Devolução</th></tr>";
        }
        else if (valor == 3) {
            cabeca.innerHTML = "<tr><th>Categorias</th><th>Total de Livros</th></tr>";
        }
        else if (valor == 4) {
            cabeca.innerHTML = "<tr><th>Autores</th><th>Total de Livros</th></tr>";
        }
        else if (valor == 5) {
            cabeca.innerHTML = "<tr><th>Leitor</th><th>Endereço Completo</th></tr>";
        }
        else if (valor == 6) {
            cabeca.innerHTML = "<tr><th>Categoria</th><th>Título</th><th>Leitor</th></tr>";
        }

        const resposta = await fetch("./api/ler.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                cod: valor
            })
        });

        const resultado = await resposta.json();
        let linha = "";

        resultado.forEach(linha => {
            const tr = document.createElement("tr");

            for (const campo in linha){
                const td = document.createElement("td");
                td.textContent = linha[campo];
                tr.appendChild(td);
            };

            tabela.appendChild(tr);
        });
    });
})