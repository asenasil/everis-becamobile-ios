import Alamofire

class FilmesAPI {
    // Variaveis Globais
    
    func requisicao() -> [Filme] {
        
        let urlDosFilmesString = "https://api.themoviedb.org/3/trending/movie/week?api_key=4f67d4725088eb6ab226f2ca2c1d8902&language=pt-BR"
        
        if let urlDosFilmes = URL(string: urlDosFilmesString){
            if let dadosUrlDosFilmes = try? Data(contentsOf: urlDosFilmes){
                let decodificador = JSONDecoder()
                if let resultadosFilmes = try? decodificador.decode(ResultadosFilmes.self, from: dadosUrlDosFilmes){
                    print("VOCE VAI CONSEGUIR, ACREDITE EM DEUS")
                    print(resultadosFilmes)
                    return resultadosFilmes.results
                }
            }
        }
        
        print("Falha ao pegar os filmes")
        return []
    }
    
}
