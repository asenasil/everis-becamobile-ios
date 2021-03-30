//
//  DetalheFilmesViewController.swift
//  MyProjectFilmes
//
//  Created by Adalberto Sena Silva on 29/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import UIKit

class DetalheFilmesViewController: UIViewController {

    @IBOutlet weak var tituloDetalhes: UILabel!
    
    @IBOutlet weak var imagemDetalhes: UIImageView!
    
    @IBOutlet weak var sinopseDetalhes: UILabel!
    
    @IBOutlet weak var lancamentoDetalhes: UILabel!
  
    //Variaveis Globais
    
    let detalheFilmes:FilmesAPI = FilmesAPI("4f67d4725088eb6ab226f2ca2c1d8902")
    var meuFilme:[String:Any]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarFilmes()
    }
    
    func mostrarFilmes(){
        
        guard let filme =  meuFilme  else{
            print("Erro ao pegar detalhe do filme")
            return
        }
        
        guard let id = filme["id"] as? Int else{
            print("Erro ao pegar id do filme")
            return
        }
        
        guard let tituloDetalhes = filme["title"] as? String else{
            print("Erro ao pegar titulo do filme")
            return
        }
        
        guard let imagemDetalhes = filme["imagem"] as? UIImage else{
            print("Erro ao pegar imagem do filme")
            return
        }
        
        detalheFilmes.detalheDoFilmeEscolhido(id){
            (retorno) in
            guard let sinopseDetalhes = retorno["overview"] as? String else{
                print("Erro ao detalhar sinopse")
                return
            }
            guard let lancamentoDetalhes = retorno["release_date"] as? String else{
                print("Erro ao detalhar data de lancamento")
                return
            }
            
            let lancamentoDataDetalhes:[String] = lancamentoDetalhes.components(separatedBy: "-")
            let lancamentoDataFim = "\(lancamentoDataDetalhes[2])/\(lancamentoDataDetalhes[1])/\(lancamentoDataDetalhes[0])"
            
            self.tituloDetalhes.text = tituloDetalhes
            self.sinopseDetalhes.text = sinopseDetalhes
            self.lancamentoDetalhes.text = lancamentoDataFim
            self.imagemDetalhes.image = imagemDetalhes
        }
    }
    
    
}
