import UIKit

@objc protocol NewPostRoutingLogic
{
  func routeToParent(segue: UIStoryboardSegue?)
}

protocol NewPostDataPassing
{
  var dataStore: NewPostDataStore? { get }
}

class NewPostRouter: NSObject, NewPostRoutingLogic, NewPostDataPassing
{
  weak var viewController: NewPostViewController?
  var dataStore: NewPostDataStore?
  
  // MARK: Routing
  
 func routeToParent(segue: UIStoryboardSegue?)
  {
    // Get the destination view controller and data store
    let destinationNC = viewController?.presentingViewController as! UINavigationController
    let destinationVC = destinationNC.topViewController as! FeedViewController

    var destinationDS = destinationVC.router!.dataStore!

    // Pass data to the destination data store
    passDataToParent(source: dataStore!, destination: &destinationDS)

    // Navigate to the destination view controller
    navigateToParent(source: viewController!, destination: destinationVC)
  }

  // MARK: Navigation
  
  func navigateToParent(source: NewPostViewController, destination: FeedViewController)
  {
    source.dismiss(animated: true, completion: nil)
  }
  
  // MARK: Passing data
  
  func passDataToParent(source: NewPostDataStore, destination: inout FeedDataStore)
  {
    let data = NewPost.NewPost.Request(text: source.text, image1: source.image1, image2: source.image2, image3: source.image3)
    destination.newPost = data
  }
}
