import UIKit

extension UIView {
  func applyBorderConner(radius: CGFloat, color: UIColor) {
    self.layer.cornerRadius = radius
    self.layer.borderWidth = 1
    self.layer.borderColor = color.cgColor
  }
}
