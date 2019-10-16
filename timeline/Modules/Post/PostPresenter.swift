import UIKit

protocol PostPresentationLogic
{
  func presentPost(response: Post.Post.Response)
  func presentFullImage(response: Post.FullImage.Response)
}

class PostPresenter: PostPresentationLogic
{
  weak var viewController: PostDisplayLogic?
  
  // MARK: Do something
  
  func presentPost(response: Post.Post.Response)
  {
    let viewModel = Post.Post.ViewModel(data: response.data)
    viewController?.displayPost(viewModel: viewModel)
  }

  func presentFullImage(response: Post.FullImage.Response) {
    let viewModel = Post.FullImage.ViewModel(image: response.image)
    viewController?.displayFullImage(viewModel: viewModel)
  }
}
