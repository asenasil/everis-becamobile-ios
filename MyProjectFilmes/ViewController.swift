//
//  ViewController.swift
//  MyProjectFilmes
//
//  Created by Adalberto Sena Silva on 26/03/21.
//  Copyright © 2021 filmes. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

 
    @IBOutlet weak var respostaText: UITextView!
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
 
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
 
    func execute(_ url: URL, completion: @escaping WebServiceResponse) {
        Alamofire.request(url).validate().responseJSON { (response) in
            if let error = response.error {
                completion(nil, error)
                
            } else if  let jsonArray = response.result.value as? [[String: Any]] {
                completion(jsonArray, nil)
                
            } else if let jsonDict = response.result.value as? [String: Any] {
                completion([jsonDict], nil)
                
            }
        }
        
        
        
    }
    @IBAction func buttonAcao(_ sender: Any) {
        
        let MinhaApiKey = "4f67d4725088eb6ab226f2ca2c1d8902"
        
        guard let urlToExecute = URL(string:"https://api.themoviedb.org/3/movie/550?api_key=\(MinhaApiKey)") else {
            return
        }

        execute(urlToExecute) { (json, error) in
            if let error = error {
                self.respostaText.text = error.localizedDescription
                
            } else if let json = json {
                
                self.respostaText.text = json.description
                
            }

        }
        
    }
    
}

