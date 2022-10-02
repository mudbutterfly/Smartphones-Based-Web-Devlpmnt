//
//  TouristCellTableViewCell.swift
//  tourist locations
//
//  Created by Kiki Pan on 10/1/22.
//

import UIKit

class TouristCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblLoc: UILabel!
    @IBOutlet weak var imgLoc: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
