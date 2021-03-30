import Foundation

struct Filme:Codable {
    
    let title:String
    let overview:String
    let id:Int
    let posterPath:String
    let voteAverage:Double
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case overview
        case id
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
    
}
