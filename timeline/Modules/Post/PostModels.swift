import UIKit

enum Post
{
  // MARK: Use cases

  enum Post
  {
    struct Request
    {
    }
    struct Response
    {
      let data: PresentModel
    }
    struct ViewModel
    {
      let data: PresentModel
    }
  }

  enum FullImage {
    struct Request
    {
      let image: UIImage?
    }
    struct Response
    {
      let image: UIImage?
    }
    struct ViewModel
    {
      let image: UIImage?

    }
  }
}
