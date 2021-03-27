//
//  FilmesAPI.swift
//  MyProjectFilmes
//
//  Created by Adalberto Sena Silva on 26/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FilmesAPI: NSObject {

    // variaveis globais
    var listaDeFilme:[String: Any] = [:]
    var minhaApiKey:String = "4f67d4725088eb6ab226f2ca2c1d8902"
    
    init(_ chave:String) {
        self.minhaApiKey = chave
    }
    
    // MARK - GET
    func puxaFilmes(acabou: @escaping(_ listaDeFilme: [[String:Any]]) -> Void){
        
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=\(minhaApiKey)&language=pt-BR", method: .get) .responseJSON { (response) in
        switch response.result {
        case .success:
            if let resultadoR = response.result.value as? [String: Any]{
                guard let listaResult = resultadoR["results"] as? [[String: Any]]
                    else {
                        return}
                acabou(listaResult)
            }
            break
            
        case .failure:
            print(response.error!)
            break
        }
    }
  }
    
    // MARK mostra Imagens
    
    func mostraImagens(acabou: @escaping(_ listandoFilmes: [[String:Any]]) ->Void){
        self.puxaFilmes { (voltaFilmes) in
            
            var filme: [[String:Any]] = [[:]]
            
            for filmes in voltaFilmes{
                
                if(filmes ["title"] != nil){
                    
                    guard let tituloFilme = filmes["title"] else{
                        print("erro ao pegar titulo")
                        return
                    }
                    guard let idFilme = filmes["id"] else{
                        print("erro ao pegar id")
                        return
                    }
                    guard let caminhoFilme = filmes["poster_path"] else {
                        print("erro ao pegar capa do filme")
                        return
                    }
                    guard let urlCartaz = URL(string: "https://image.tmdb.org/t/p/w500\(caminhoFilme)") else{
                        print("erro ao pegar URL do cartaz")
                        return
                    }
                    
                    var filmeComImagem:[String:Any] = [:]
                    Alamofire.request(urlCartaz, method: .get).responseImage(completionHandler: {
                        (response) in
                        switch response.result {
                        case .success:
                            guard let cartazFilme = response.result.value else {
                                print("falha ao pegar a capa")
                                return
                            }
                            
                            filmeComImagem = [
                                "titulo": tituloFilme,
                                "imagem": cartazFilme,
                                "id": idFilme
                            ]
                            filme.append(filmeComImagem)
                            acabou(filme)
                            break
                        case .failure:
                            print("Erro: Nao foi possivel encontrar imagem")
                            break
                        }
                    })
                }
            }
            
        }
}
}
