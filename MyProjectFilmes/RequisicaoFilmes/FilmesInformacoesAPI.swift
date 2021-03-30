import Alamofire

class FilmesInformacoesAPI{
    
    func requisicao(para id: Int) -> FilmeInfo? {
        let filmeInfoVazio: FilmeInfo? = nil
        let urlDaInfoString = "https://api.themoviedb.org/3/movie/\(id))?api_key=4f67d4725088eb6ab226f2ca2c1d8902&language=pt-BR"
        
        if let urlDaInfo = URL(string: urlDaInfoString){
            if let dadosUrlDaInfo = try? Data(contentsOf: urlDaInfo){
                let decodificador = JSONDecoder()
                if let resultadoInfo = try? decodificador.decode(FilmeInfo.self, from: dadosUrlDaInfo){
                    return resultadoInfo
                }
            }
        }
        print("Falha ao pegar os Infos do filme \(id)")
        return filmeInfoVazio
    }
    
}
