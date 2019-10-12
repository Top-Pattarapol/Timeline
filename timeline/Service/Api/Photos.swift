// MARK: - Request
struct PhotosRequest: RequestProtocol {
  let url = "/public-api/photos"
  typealias ResponseType = Albums
}

// MARK: - Response
struct Photos: Decodable {
    let result: [Photo]

    enum CodingKeys: String, CodingKey {
        case result
    }
}

struct Photo: Decodable {
    let id, albumID, title: String
    let url, thumbnail: String
    let links: Links

    enum CodingKeys: String, CodingKey {
        case id
        case albumID = "album_id"
        case title, url, thumbnail
        case links = "_links"
    }
}
