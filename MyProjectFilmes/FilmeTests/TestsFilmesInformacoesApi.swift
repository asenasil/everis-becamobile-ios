//
//  TestsFilmesInformacoesApi.swift
//  MyProjectFilmesUITests
//
//  Created by Adalberto Sena Silva on 31/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import XCTest
@testable import MyProjectFilmes

class TestsFilmesInformacoesApi: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDeveVerificarClasseFilmesInformacoesAPI(){
        
        func requisicao(para id: Int) -> FilmeInfo? {
            let filmeInfoVazio: FilmeInfo? = nil
            let urlDaInfoString = "https://api.themoviedb.org/3/movie/\(id))?api_key=4f67d4725088eb6ab226f2ca2c1d8902&language=pt-BR"
            
            if let urlDaInfo = URL(string: urlDaInfoString){
                if let dadosUrlDaInfo = try? Data(contentsOf: urlDaInfo){
                    let decodificador = JSONDecoder()
                    if let resultadoInfo = try? decodificador.decode(FilmeInfo.self, from: dadosUrlDaInfo){
                        return resultadoInfo
                    }
                }
            }
            
            XCTAssertEqual("https://api.themoviedb.org/3/movie/\(id))?api_key=4f67d4725088eb6ab226f2ca2c1d8902&language=pt-BR", urlDaInfoString)
            
            print("Falha ao pegar os Infos do filme \(id)")
            return filmeInfoVazio
        }
    }
  
}
