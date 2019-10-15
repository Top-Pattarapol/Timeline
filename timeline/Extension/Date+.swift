import Foundation

extension Date {
  
  func getTime() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    return formatter.string(from: self)
  }
}
