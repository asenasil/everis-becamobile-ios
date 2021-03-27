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
}
