
// MARK: - Request
struct AlbumsRequest: RequestProtocol {
  let url = "/public-api/albums"
  let headers: [String : String]
  
  typealias ResponseType = Albums
  
  init() {
    headers = [
      "Authorization": "Bearer d3wjvB4clXkOAUmfKQSG5U54ERD9Ncp60C04",
    ]
  }
}

// MARK: - Response

struct Albums: Codable {
  let meta: Meta
  let result: [Result]
  
  enum CodingKeys: String, CodingKey {
    case meta = "_meta"
    case result
  }
}

struct Meta: Codable {
  let success: Bool
  let code: Int
  let message: String
  let totalCount, pageCount, currentPage, perPage: Int
  let rateLimit: RateLimit
}

struct RateLimit: Codable {
  let limit, remaining, reset: Int
}

struct Result: Codable {
  let id, userID, title: String
  let links: Links
  
  enum CodingKeys: String, CodingKey {
    case id
    case userID = "user_id"
    case title
    case links = "_links"
  }
}

struct Links: Codable {
  let linksSelf, edit: Edit
  
  enum CodingKeys: String, CodingKey {
    case linksSelf = "self"
    case edit
  }
}

struct Edit: Codable {
  let href: String
}
