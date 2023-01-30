//
//  RMTableViewCell.swift
//  ZaraTest
//
//  Created by JOEDELROSARIO on 29/1/23.
//

import UIKit

class RMTableViewCell: UITableViewCell {
    
    static let nibName: String = "RMTableViewCell"
    static let identifier: String = "RMCell"
    
    @IBOutlet weak var imgFirst: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblLastKnowLocation: UILabel!
    @IBOutlet weak var lblFirstSeenIn: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
