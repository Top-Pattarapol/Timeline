import UIKit

@objc protocol PostRoutingLogic
{
}

protocol PostDataPassing
{
  var dataStore: PostDataStore? { get }
}

class PostRouter: NSObject, PostRoutingLogic, PostDataPassing
{
  weak var viewController: PostViewController?
  var dataStore: PostDataStore?
  
  // MARK: Routing

  // MARK: Navigation

  // MARK: Passing data

}
