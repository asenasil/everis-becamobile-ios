//
//  Filmes.swift
//  MyProjectFilmes
//
//  Created by Adalberto Sena Silva on 26/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import UIKit

class Filmes: NSObject {

    let tituloCartaz:String
    let caminhoDaImagem:String
    
    init(tituloCartaz:String, caminhoDaImagem: String){
        self.tituloCartaz = tituloCartaz
        self.caminhoDaImagem = caminhoDaImagem
        
    }
    
}
