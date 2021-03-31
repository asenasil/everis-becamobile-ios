//
//  TestsFilmesApi.swift
//  MyProjectFilmesUITests
//
//  Created by Adalberto Sena Silva on 31/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import XCTest
@testable import MyProjectFilmes


class TestsFilmesApi: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDeveValidarUrlDaFilmesAPI(){
        
        //Cenario
        
        func requisicao() -> [Filme] {
            
            let urlDosFilmesString = "https://api.themoviedb.org/3/trending/movie/week?api_key=4f67d4725088eb6ab226f2ca2c1d8902&language=pt-BR"
            
            if let urlDosFilmes = URL(string: urlDosFilmesString){
                if let dadosUrlDosFilmes = try? Data(contentsOf: urlDosFilmes){
                    let decodificador = JSONDecoder()
                    if let resultadosFilmes = try? decodificador.decode(ResultadosFilmes.self, from: dadosUrlDosFilmes){
                        
                        return resultadosFilmes.results
                    }
                }
            }
            
            XCTAssertEqual("https://api.themoviedb.org/3/trending/movie/week?api_key=4f67d4725088eb6ab226f2ca2c1d8902&language=pt-BR", urlDosFilmesString)
            

            print("Falha ao pegar os filmes")
            return []
            
           
        }

    
    }

}
