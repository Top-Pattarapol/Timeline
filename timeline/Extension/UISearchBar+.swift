import UIKit
extension UISearchBar {
  
  func setCenteredPlaceHolder(){
    let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
    
    //get the sizes
    let searchBarWidth = self.frame.width - 16
    let placeholderIconWidth = textFieldInsideSearchBar?.leftView?.frame.width ?? 0
    let placeHolderWidth = textFieldInsideSearchBar?.attributedPlaceholder?.size().width ?? 0
    let offsetIconToPlaceholder: CGFloat = 8
    let placeHolderWithIcon = placeholderIconWidth + offsetIconToPlaceholder
    
    let offset = UIOffset(horizontal: (searchBarWidth - (placeHolderWidth + placeHolderWithIcon)) / 2, vertical: 0)
    self.setPositionAdjustment(offset, for: .search)
  }
  
  func setDefaultView() {
    let offset = UIOffset(horizontal: 0, vertical: 0)
    self.setPositionAdjustment(offset, for: .search)
  }
}
