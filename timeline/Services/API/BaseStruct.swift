struct Links: Decodable {
  let linksSelf, edit: Edit

  enum CodingKeys: String, CodingKey {
    case linksSelf = "self"
    case edit
  }
}

struct Edit: Decodable {
  let href: String
}
