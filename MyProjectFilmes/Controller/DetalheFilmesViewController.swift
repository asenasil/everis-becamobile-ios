//
//  DetalheFilmesViewController.swift
//  MyProjectFilmes
//
//  Created by Adalberto Sena Silva on 29/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import UIKit

class DetalheFilmesViewController: UIViewController, UINavigationControllerDelegate {
    
    

    @IBOutlet weak var tituloDetalhes: UILabel!
    
    @IBOutlet weak var imagemDetalhes: UIImageView!
    
    @IBOutlet weak var sinopseDetalhes: UILabel!
    
    @IBOutlet weak var lancamentoDetalhes: UILabel!
    
    //Variaveis Globais
    
    let filmesInformacoesAPI = FilmesInformacoesAPI()
    var menuPrincipalViewController: MenuPrincipal?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let idFilmeSelecionado = menuPrincipalViewController?.idFilmeEscolhido else{return}
        
        guard let informacaoFilmeSelecionado = filmesInformacoesAPI.requisicao(para: idFilmeSelecionado) else {return}
        
        tituloDetalhes.text = informacaoFilmeSelecionado.originalTitle
        sinopseDetalhes.text = informacaoFilmeSelecionado.overview
        lancamentoDetalhes.text = "\(informacaoFilmeSelecionado.voteAverage)"

        
        let urlCartaz = URL(string: "https://image.tmdb.org/t/p/w300/\(informacaoFilmeSelecionado.backdropPath)")
        
        
        
        imagemDetalhes.af_setImage(withURL: urlCartaz!)
        
        imagemDetalhes.layer.cornerRadius = 10
        imagemDetalhes.layer.masksToBounds = true
         
        
    }

    
}
