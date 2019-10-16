import UIKit

extension UITableView {
  
  func registerNib<T: UITableViewCell>(_: T.Type) {
    register(T.nib(), forCellReuseIdentifier: T.identifier)
  }
  
  func deque<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
      fatalError("Could not deque cell with type \(T.self)")
    }
    
    return cell
  }
}
