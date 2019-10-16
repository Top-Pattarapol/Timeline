import UIKit

class FeedWorker
{

  func getAlbums(success: @escaping (Albums) -> Void, error: @escaping (Error)  -> Void) {
    _ = WebService(host: .Gorest).request(AlbumsRequest()) { result in
      switch result {
      case .success(let data):
        success(data)
      case .failure(let err):
        error(err)
      }
    }
  }

  func getPhoto(albumId: String, success: @escaping (Photos) -> Void, error: @escaping (Error)  -> Void) {
    _ = WebService(host: .Gorest).request(PhotosRequest(albumId: albumId)) { result in
      switch result {
      case .success(let data):
        success(data)
      case .failure(let err):
        error(err)
      }
    }
  }
}
