import UIKit

protocol PostBusinessLogic
{
  func getPost(request: Post.Post.Request)
  func getFullImage(request: Post.FullImage.Request)
}

protocol PostDataStore
{
  var data: PresentModel? { get set }
}

class PostInteractor: PostBusinessLogic, PostDataStore
{
  var presenter: PostPresentationLogic?
  var worker: PostWorker?
  var data: PresentModel?
  
  // MARK: Do something
  
  func getPost(request: Post.Post.Request)
  {
    guard let data = data else { return }
    let response = Post.Post.Response(data: data)
    presenter?.presentPost(response: response)
  }

  func getFullImage(request: Post.FullImage.Request) {
    let response = Post.FullImage.Response(image: request.image)
    presenter?.presentFullImage(response: response)
  }
}
