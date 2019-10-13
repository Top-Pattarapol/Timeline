import UIKit

extension UIView {

  @inline(__always) class func nib(bundle: Bundle? = nil) -> UINib {
    return UINib(nibName: identifier, bundle: bundle)
  }

  static var identifier: String {
    return String(describing: self)
  }
}
