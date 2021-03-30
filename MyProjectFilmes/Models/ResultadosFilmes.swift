import Foundation

struct ResultadosFilmes:Codable {
    
    let results: [Filme]
    
    enum CodingKeys: String, CodingKey {
        
        case results
    }
    
}
