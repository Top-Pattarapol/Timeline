enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
}

protocol RequestProtocol {
  var method: HTTPMethod { get }
  var url: String { get }
  var headers: [String: String] { get }
  var body: [String: Any] { get }
  associatedtype ResponseType: Decodable
}

extension RequestProtocol {
  
  var method: HTTPMethod {
    return .get
  }
  
  var headers: [String: String] {
    return [:]
  }
  
  var body: [String: Any] {
    return [:]
  }
}

enum APIError: Error {
  case error(Error)
  case dataIsNil
  case cannotParseData
}
