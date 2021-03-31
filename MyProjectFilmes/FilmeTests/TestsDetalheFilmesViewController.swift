//
//  TestsDetalheFilmesViewController.swift
//  MyProjectFilmesUITests
//
//  Created by Adalberto Sena Silva on 31/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import XCTest
@testable import MyProjectFilmes


class TestsDetalheFilmesViewController: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDeveValidarClasseDetalheFilmesViewController(){
        
       
        
        //Variaveis Globais
        
        let filmesInformacoesAPI = FilmesInformacoesAPI()
        var menuPrincipalViewController: MenuPrincipal?
        

            guard let idFilmeSelecionado = menuPrincipalViewController?.idFilmeEscolhido else{return}
            
            guard let informacaoFilmeSelecionado = filmesInformacoesAPI.requisicao(para: idFilmeSelecionado) else {return}
            
            tituloDetalhes.text = informacaoFilmeSelecionado.originalTitle
            sinopseDetalhes.text = informacaoFilmeSelecionado.overview
            lancamentoDetalhes.text = "\(informacaoFilmeSelecionado.voteAverage)"
            
            //        self.scrollview.contentSize = CGSize(width: self.scrollview.frame.width, height: self.scrollview.frame.height + 320)
            
            
            
            let urlCartaz = URL(string: "https://image.tmdb.org/t/p/w300/\(informacaoFilmeSelecionado.backdropPath)")
            
            imagemDetalhes.af_setImage(withURL: urlCartaz!)
            
            
            
        }
    
    
    }

}
