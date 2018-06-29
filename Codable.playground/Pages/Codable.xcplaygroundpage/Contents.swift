import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

struct Course: Decodable {
    
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let number_of_lessons: String
    
//    init(json: [String:Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//        number_of_lessons = json["number_of_lessons"] as? String ?? ""
//    }
}

let url: String = "https://api.letsbuildthatapp.com/jsondecodable/course"

URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) -> Void in
    /* GUARD: Was there an error? */
    guard error == nil else {
        print("There was an error with your request: \(error!)")
        return
    }
    
    /* GUARD: Did we get a successful 2XX response? */
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
        print("Your request returned a status code other than 2xx!")
        return
    }
    
    /* GUARD: Was there any data returned? */
    guard let data = data else {
        print("No data was returned by the request!")
        return
    }
    
    do {
        //Swift 4
        let course = try? JSONDecoder().decode(Course.self, from: data)
        print(course)
        // Swift 2/3/ObjC
//        guard let json = try JSONSerialization.jsonObject(with:data,options: .mutableContainers) as? [String:Any] else {return}
//        print(json)
//        let course = Course(json: json)
//        print(course)
    } catch let err {
        print(err)
    }
}.resume()


