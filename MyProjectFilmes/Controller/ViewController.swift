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

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    // Variaveis Globais
    let filmesViewControl:FilmesAPI = FilmesAPI("4f67d4725088eb6ab226f2ca2c1d8902")
    var todosFilmesViewControl:[[String:Any]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostraFilmesCartaz.delegate = self
        mostraFilmesCartaz.dataSource = self
        exibiFilmes()

    }
    @IBOutlet weak var mostraFilmesCartaz: UICollectionView!
    
    //Metodos
    
    func exibiFilmes(){
        filmesViewControl.mostraImagens { (retornaFilmes) in
            self.todosFilmesViewControl = retornaFilmes
            self.mostraFilmesCartaz.reloadData()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.todosFilmesViewControl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let campoFilmes = collectionView.dequeueReusableCell(withReuseIdentifier: "campoFilmes", for: indexPath) as! MostrarFilmesCartazCollectionViewCell
        let escolheFilme = self.todosFilmesViewControl[indexPath.item]
        guard let capaCartaz = escolheFilme["imagem"] as? UIImage else{
            return campoFilmes
        }
        guard let tituloFilme = escolheFilme["titulo"] as? String else{
            return campoFilmes
        }
        campoFilmes.imagemDoFilme.image = capaCartaz
        campoFilmes.tituloFilme.text = tituloFilme
        
        return campoFilmes
    }
}

