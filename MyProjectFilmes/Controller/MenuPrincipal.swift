//
//  ViewController.swift
//  MyProjectFilmes
//
//  Created by Adalberto Sena Silva on 26/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MenuPrincipal: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    // Variaveis Globais
    var idFilmeEscolhido = 1
    var listaFilmes = [Filme]()
    var filmesApi = FilmesAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostraFilmesCartaz.dataSource = self
        mostraFilmesCartaz.delegate = self
        listaFilmes = filmesApi.requisicao()
    }
    
    @IBOutlet weak var mostraFilmesCartaz: UICollectionView!
    
    //Funcoes do Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let campoFilmes = collectionView.dequeueReusableCell(withReuseIdentifier: "campoFilmes", for: indexPath) as! MostrarFilmesCartazCollectionViewCell
        
        let filme = listaFilmes[indexPath.row]
        
        campoFilmes.tituloFilme.text = filme.title
        
        let urlCartaz = URL(string: "https://image.tmdb.org/t/p/w300/\(filme.posterPath)")
        
        campoFilmes.imagemDoFilme.af_setImage(withURL: urlCartaz!)
        
        return campoFilmes
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        idFilmeEscolhido = listaFilmes[indexPath.row].id

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let telaDetalhes = segue.destination as? DetalheFilmesViewController{
            
            telaDetalhes.menuPrincipalViewController = self
        }
    }
    
}
