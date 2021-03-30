import Foundation

// MARK: - FilmeInfo
struct FilmeInfo: Codable {
    
    let originalTitle: String
    let overview: String
    let voteAverage: Double
    let backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        
        case originalTitle = "original_title"
        case overview
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        
    }
    
}
