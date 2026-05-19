document.addEventListener("DOMContentLoaded", () => {
    const tabela = document.getElementById("tabela-saida");
    const cabeca = document.getElementById("tabela-cabeca")
    const selecao = document.getElementById("filtro");

    selecao.addEventListener("input", async () => {
        let valor = selecao.value;
        cabeca.innerHTML = "";
        tabela.innerHTML = "";

        if (valor = 1) {
            cabeca.innerHTML = "<tr><th>Título</th><th>Leitor</th><th>Data de Emprestimo</th></tr>";

        }
        else if (valor = 2) {
            abeca.innerHTML = "<tr><th>Título</th><th>Leitor</th><th>Data de Emprestimo</th></tr>";
        }
        else if (valor = 3) {

        }
        else if (valor = 4) {

        }
        else if (valor = 5) {

        }
        else if (valor = 6) {

        }
        else {

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
            console.log(linha);

            for (const campo in linha){
                const td = document.createElement("td");
                td.textContent = linha[campo];
                tr.appendChild(td);
            };

            tabela.appendChild(tr);
        });
    });
})
