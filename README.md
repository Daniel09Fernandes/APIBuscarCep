# BUSCA CEP
---

## O Projeto API.CEP conta com alguns padrões de projeto, como:
### Singleton
  - Aplicado na Controller para garantir apenas uma instância.
### MVC
  - Camadas Controller, e Model(Usando como DTO)
### Repository
  -  Aplicada para consumir a API de terceiros.
### Services.
  - Responsável pelas regras de negócios, antes de devolver uma resposta para o client.
### Modules
 - Para libs extras, como GerarLog, e ClientSock, que consome a API de terceiros via REST 


Estes padrões(Repository e Services) ajudam a desacoplar a lógica da camada Model da
aplicação.
Com a aplicação da Repository e Services, a Model passa a ser uma DTO apenas, ou Entity, como
preferir.

---

## Arquitetura

- Utilizado o Horser, escutando na porta 9000.
- Aplicado paralelismo ao Horse, para liberar o terminar, assim, pode ser encerrada a API, ao
pressionar qualquer tecla do terminal.

---

## Fluxo de comunicação
 - Controller > Services > Repository > Model.

Aplicado Generics, para que o Socket consiga retornar qualquer classe, assim, evitando escrita
excessiva para cada Model. Este feito acontece com a junção à classe Repository.

Na classe repository, o fluxo de comunicação com as APIs externas, onde, ao falhar a primeira API,
buscará a segunda, caso falhe, buscará a terceira.

Nas camadas Repository e Services foram utilizadas interfaces, assim ganhando com o garbage
collector e apoio ao Generics.

---

### Rota da API.
http://localhost:9000/BuscarCep/{cep}

Exemplo: http://localhost:9000/BuscarCep/12929-602

----

# Projeto: ApiCepTest
Aplicação de testes unitários.

Utilizado o Dunit, e montando os seguintes cenarios:
### Testes que falhará 
  - Os erros são em cenários controlados e esperados.

### Testes que obterá sucesso.

Os testes se dividiram em dois critérios,
 
### Testes via API
  - O REST chama a API, via rota, e passa os parâmetros necessários.
  - Necessário estar executando a API.
### Teste via código, isolando a API.
 - Via Services, isolado a camada da API, e chamado o método pela Service.

![image](https://github.com/user-attachments/assets/ada68042-6465-4efe-8f5f-cc6ec5ba461a)

----

# Projeto BuscaCep.Client

Para o Client, foi utilizado: 
### FMX
### Skia
## MVC
- ### View 
   - Cuidando somente do que é visual ao usuário.
- ### Controller 
   - criando a rota.
- ### Model
   - Aqui, como é o padrão MVC apenas, ficou com a lógica.

### DTO
 -  utilizado para transferência de dados, para o objeto sendo apoio para model, e renderizando
na view.

Foi reaproveitado os códigos da API, da camada Model. Pois cada API Externa tem sua própria model. 
Para renderizar estas Model na view, foi unificada em uma única Model. Mediante um parse realizado pela model.

Foi Reaproveitado a Modules da Api, para gerar logs.

### Fluxo de comunicação 
 View > Controller > Model > Dto; 

---

# Utilização 

- Abrir o executável, APICep.exe. Que se encontra em:.\TOTVS-CEP\API\Bin\Exe
Após ter iniciado a API, 
- Abrir o Buscador de CEP que se comunicará com a API.
Este Buscador de CEP se encontra em: TOTVS-CEP\Client\Bin\Exe

Com ambos Executáveis abertos, estamos aptos a utilizar nosso programa.
![image](https://github.com/user-attachments/assets/9d824fa8-7378-4d57-8032-25f79948ea7c)

### Para utilizar 

Basta informar um CEP e clicar no botão de pesquisar, à frente do CEP.
Caso o CEP seja valido, trará as demais informações, como Logradouro, Bairro, Cidade e UF

![image](https://github.com/user-attachments/assets/a6270bdf-0dfe-429f-80aa-94d7cad95e58)


