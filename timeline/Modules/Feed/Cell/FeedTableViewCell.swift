import UIKit

class FeedTableViewCell: UITableViewCell {

  @IBOutlet var timeLabel: UILabel!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var image1: UIImageView!
  @IBOutlet var image2: UIImageView!
  @IBOutlet var image3: UIImageView!
  @IBOutlet var leftSide: UIStackView!
  var id: Int?
  

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: "feedTableViewCell")
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
  }

}
