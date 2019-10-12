class WebService {
  let baseURL: String
  let baseHeaders: [String: String]
  
  init(baseURL: String, baseHeaders: [String: String] = [:]) {
    self.baseURL = baseURL
    self.baseHeaders = baseHeaders
  }
  
  init(host: Host) {
    self.baseURL = host.baseURL
    self.baseHeaders = host.baseHeaders
  }
  
  func request<R: RequestProtocol>(
    _ request: R,
    result: @escaping (Swift.Result<R.ResponseType, APIError>) -> Void)
    -> RequestConnection<R> {
      let connection = RequestConnection(request, baseURL: baseURL, headers: baseHeaders)
      _ = connection.responseJSON(result: result)
      return connection
  }
}

enum Host {
  case gorest
  
  var baseURL: String {
    switch self {
    case .gorest:
      return "https://gorest.co.in"
    }
  }
  
  var baseHeaders: [String: String] {
    switch self {
    case .gorest:
      return ["Authorization": "Bearer d3wjvB4clXkOAUmfKQSG5U54ERD9Ncp60C04",]
    }
  }
}
