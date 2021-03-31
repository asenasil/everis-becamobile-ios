# everis-becamobile-ios
Avaliação Beca Mobile iOS

Dificuldades até o momento:

1 - Tive dificuldade para implementar as requisições sem o CODABLE, depois que entendi o Codable eu consegui implementar classes para receber o Json e duas classes
chamando as API.

2 - Tive dificuldade para puxar as API's e mostrar na tela o result

3 - Na parte de layouts eu nao consegui implementar do jeito que queria, trazendo um Strack View e colocando uma ScrowView para a label sinopse.

4 - Tive dificuldade para implementar alguns testes, nao tive noção como criar os testes para as minhas classes visto que nao tem metodos que façam "if".


Solucoes:

Bom, para chegar na solucao eu fiz 2 classes para receber o JSON e uma classe resultado para receber o array de filmes. Criei duas APIs, uma puxando o URL dos filmes e tratando para retornar o resultado do array de filmes. A segunda API é a requisicao do ID do filme onde eu faço uma requisicao passando a URL e o ID da Classe FilmeInfo.

Depois das requisições eu chamo elas em dois momentos; Primeiro momento eu chamo no MenuPrincipal onde instancio a classe FilmesAPI para o projeto e tambem a lista 
de Filmes. Depois eu só chamo eles quando eu chamar as funcoes da Collecion. Segundo momento eu chamo no DetalheFilmesViewController onde instancio a API FilmesInformacoesAPI e crio a variavel para receber o filme selecionado tratando ela na sequencia. Por fim chamo nessa tela detalhes a url do filme selecionado.
