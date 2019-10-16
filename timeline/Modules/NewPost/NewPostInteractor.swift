import UIKit

protocol NewPostBusinessLogic
{
  func setNewPost(request: NewPost.NewPost.Request)
}

protocol NewPostDataStore
{
  var text: String { get set }
  var image1: UIImage? { get set }
  var image2: UIImage? { get set }
  var image3: UIImage? { get set }
}

class NewPostInteractor: NewPostBusinessLogic, NewPostDataStore
{
  var presenter: NewPostPresentationLogic?
  var worker: NewPostWorker?
  var text: String = ""
  var image1: UIImage?
  var image2: UIImage?
  var image3: UIImage?
  
  // MARK: Do something

  func setNewPost(request: NewPost.NewPost.Request) {
    text = request.text
    image1 = request.image1
    image2 = request.image2
    image3 = request.image3
    presenter?.presentNewPost(response: NewPost.NewPost.Response())
  }
}
