// MARK: - Request
struct AlbumsRequest: RequestProtocol {
  let url = "/public-api/albums"
  typealias ResponseType = Albums
}

// MARK: - Response

struct Albums: Decodable {
  let result: [Album]
  
  enum CodingKeys: String, CodingKey {
    case result
  }
}

struct Album: Decodable {
  let id, userID, title: String
  let links: Links
  
  enum CodingKeys: String, CodingKey {
    case id
    case userID = "user_id"
    case title
    case links = "_links"
  }
}
