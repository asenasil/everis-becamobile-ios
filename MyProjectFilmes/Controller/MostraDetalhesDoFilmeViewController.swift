//
//  MostraDetalhesDoFilmeViewController.swift
//  MyProjectFilmes
//
//  Created by Adalberto Sena Silva on 28/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import UIKit

class MostraDetalhesDoFilmeViewController: UIViewController {

  
    @IBOutlet weak var tituloFilmes: UILabel!
    @IBOutlet weak var imagemFilmes: UIImageView!
    @IBOutlet weak var sinopseFilmes: UILabel!
    @IBOutlet weak var dataLancamentoFilmes: UILabel!
    
    
    @IBAction func voltarMenuCartaz(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //Variaveis Globais
    
    let detalheDosFilmes:FilmesAPI = FilmesAPI("4f67d4725088eb6ab226f2ca2c1d8902")
    var filmeEscolhidoCartaz:[String:Any]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarFilmeEscolhido()
        
        
    }
    
    //Metodos
    
    func mostrarFilmeEscolhido(){
        guard let filmeEscolhido = filmeEscolhidoCartaz as? [String: Any] else {
            print("Erro ao pegar filme escolhido")
            return
        }
        
        guard let idDoFilme = filmeEscolhido["id"] as? Int else {
            print("Erro ao pegar o id do filme escolhido")
            return
        }
        
        guard let tituloDoFilme = filmeEscolhido["titulo"] as? String else {
            print("Erro ao pegar o titulo do filme escolhido")
            return
        }
        
        guard let imagemDoFilme = filmeEscolhido["imagem"] as? UIImage else {
            print("Erro ao pegar imagem do filme escolhido")
            return
        }
        
        detalheDosFilmes.detalheDosFilmes(idDoFilme){
            (retorno) in
            
            guard let sinopseFilme = retorno["overView"] as? String else{
                print("Erro ao carregar a sinopse")
                return
        }
            guard let lancamentoFilme = retorno["DataLancamento"] as? String else{
                print("Erro ao carregar data de lançamento")
                return
            }
            
            let lancamentoFilmes:[String] = lancamentoFilme.components(separatedBy: "-")
            let lancamentoFim = "\(lancamentoFilmes[2])/\(lancamentoFilmes[1])/\(lancamentoFilmes[0])"
            
            self.dataLancamentoFilmes.text = lancamentoFim
            self.sinopseFilmes.text = sinopseFilme
            self.tituloFilmes.text = tituloDoFilme
            self.imagemFilmes.image = imagemDoFilme
    }
}
}
