import UIKit

@objc protocol FeedRoutingLogic
{
  func routeToPost(segue: UIStoryboardSegue?)
}

protocol FeedDataPassing
{
  var dataStore: FeedDataStore? { get }
}

class FeedRouter: NSObject, FeedRoutingLogic, FeedDataPassing
{
  weak var viewController: FeedViewController?
  var dataStore: FeedDataStore?
  
  // MARK: Routing

  func routeToPost(segue: UIStoryboardSegue?) {
    if let segue = segue {
      let destinationVC = segue.destination as! PostViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToPost(source: dataStore!, destination: &destinationDS)
    } else {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "PostViewController") as! PostViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToPost(source: dataStore!, destination: &destinationDS)
      navigateToPost(source: viewController!, destination: destinationVC)
    }
  }

  // MARK: Navigation

  func navigateToPost(source: FeedViewController, destination: PostViewController) {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data

  func passDataToPost(source: FeedDataStore, destination: inout PostDataStore) {
    
    guard let data = source.dataPostView else {
      return
    }
    destination.data = data
  }

}
