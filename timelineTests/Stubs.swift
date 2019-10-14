import OHHTTPStubs

class Stubs {

    static func methodPostResponseWithData(json: [AnyHashable: Any]) {
        stub(condition: isMethodGET()) { _ -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(jsonObject: json, statusCode: 200, headers: ["Content-Type": "application/json"])
        }
    }
}
