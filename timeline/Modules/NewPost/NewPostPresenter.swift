import UIKit

protocol NewPostPresentationLogic
{
  func presentNewPost(response: NewPost.NewPost.Response)
}

class NewPostPresenter: NewPostPresentationLogic
{
  weak var viewController: NewPostDisplayLogic?
  
  // MARK: Do something
  
  func presentNewPost(response: NewPost.NewPost.Response)
  {
    let viewModel = NewPost.NewPost.ViewModel()
    viewController?.routeToParent(viewModel: viewModel)
  }
}
