import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true


struct TMDBMovie {
    
    // MARK: Properties
    
    let title: String
    let id: Int
    let posterPath: String?
    
    // MARK: Initializers
    
    // construct a TMDBMovie from a dictionary
    init(dictionary: [String:AnyObject]) {
        title = dictionary["title"] as! String
        id = dictionary["id"] as! Int
        posterPath = dictionary["poster_path"] as? String
    }
    
    static func moviesFromResults(_ results: [[String:AnyObject]]) -> [TMDBMovie] {
        
        var movies = [TMDBMovie]()
        
        // iterate through array of dictionaries, each Movie is a dictionary
        for result in results {
            movies.append(TMDBMovie(dictionary: result))
        }
        
        return movies
    }
}


//Convert to URL from (parameteres and method)
private func tmdbURLFromParameters(_ parameters: [String:AnyObject], withPathExtension: String? = nil) -> URL {
    
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.themoviedb.org"
    components.path = "/3" + (withPathExtension ?? "")
    components.queryItems = [URLQueryItem]()
    
    for (key, value) in parameters {
        let queryItem = URLQueryItem(name: key, value: "\(value)")
        components.queryItems!.append(queryItem)
    }
    
    return components.url!
}

func getPopularMovies(_ completionHandlerForFavMovies: @escaping (_ result: [TMDBMovie]?, _ error: NSError?) -> Void){
    
    let parametersWithApiKey = "7be6194ecfdd01d72a963df3355bb7d2"
    var parameters = [String:AnyObject]()
    parameters["api_key"] = parametersWithApiKey as AnyObject?
    let url = tmdbURLFromParameters(parameters, withPathExtension: "/movie/popular")
    let session = URLSession.shared
    let task = session.dataTask(with: url) { data, response, error in
        do {
            
            if let result = data, let dictionary = try JSONSerialization.jsonObject(with: result, options: []) as? [String: AnyObject] {
                let results = dictionary["results"] as? [[String:AnyObject]]
                let movies = TMDBMovie.moviesFromResults(results!)
                completionHandlerForFavMovies(movies,nil)
            }
        }
        catch {
            print("Error \(error)")
        }
    }
    task.resume()
}

getPopularMovies { (result, error) in
    if let movies = result {
        print(movies)
    }
}
