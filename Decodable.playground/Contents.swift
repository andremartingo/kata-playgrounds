import Foundation

struct WebsiteDescription: Decodable {
    
    let name: String
    let description: String
    let courses: [Course]
}

struct Course: Decodable {
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
}

let json = """
{
    "id": 1,
    "name": "Instagram Firebase",
    "link": "https://www.letsbuildthatapp.com/course/instagram-firebase",
    "imageUrl": "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/04782e30-d72a-4917-9d7a-c862226e0a93",
    "number_of_lessons": 49
}
""".data(using: .utf8)! // our data in native (JSON) format
let myStruct = try JSONDecoder().decode(Course.self, from: json) // Decoding our data
print("Structure 1")
print(myStruct) // decoded!!!!!

let json2 = """
[
    {
        "id": 1,
        "name": "Instagram Firebase",
        "link": "https://www.letsbuildthatapp.com/course/instagram-firebase",
        "imageUrl": "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/04782e30-d72a-4917-9d7a-c862226e0a93",
        "number_of_lessons": 49
    },
    {
        "id": 2,
        "name": "Podcasts Course",
        "link": "https://www.letsbuildthatapp.com/course/podcasts",
        "imageUrl": "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/32f98d9d-5b9b-4a22-a012-6b87fd7158c2",
        "number_of_lessons": 39
    }
]
""".data(using: .utf8)! // our data in native (JSON) format
let myStruct2 = try JSONDecoder().decode([Course].self, from: json2) // Decoding our data
print("Structure 2")
print(myStruct2) // decoded!!!!!

let json3 = """
{
    "name": "Lets Build That App",
    "description": "Teaching and Building Apps since 1999",
    "courses": [
        {
            "id": 1,
            "name": "Instagram Firebase",
            "link": "https://www.letsbuildthatapp.com/course/instagram-firebase",
            "imageUrl": "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/04782e30-d72a-4917-9d7a-c862226e0a93",
            "number_of_lessons": 49
        },
        {
            "id": 4,
            "name": "Kindle Basic Training",
            "link": "https://www.letsbuildthatapp.com/basic-training",
            "imageUrl": "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/a6180731-c077-46e7-88d5-4900514e06cf",
            "number_of_lessons": 19
        }
    ]
}

""".data(using: .utf8)! // our data in native (JSON) format
let myStruct3 = try JSONDecoder().decode(WebsiteDescription.self, from: json3) // Decoding our data
print("Structure 3")
print(myStruct3) // decoded!!!!!

let json4 = """
[
{
"id": 1,
"name": "Instagram Firebase",
"link": "https://www.letsbuildthatapp.com/course/instagram-firebase",
"imageUrl": "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/04782e30-d72a-4917-9d7a-c862226e0a93",
"number_of_lessons": 49
},
{
"id": 4,
"name": "Kindle Basic Training",
"link": "https://www.letsbuildthatapp.com/basic-training",
"imageUrl": "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/a6180731-c077-46e7-88d5-4900514e06cf",
"number_of_lessons": 19
},
{
"name": "Yelp"
}
]
""".data(using: .utf8)! // our data in native (JSON) format
let myStruct4 = try JSONDecoder().decode([Course].self, from: json4) // Decoding our data
print("Structure 4")
print(myStruct4) // decoded!!!!!

