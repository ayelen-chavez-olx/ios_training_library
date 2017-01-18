//
//  MyCustomTableViewCell.swift
//  Pods
//
//  Created by Ayelen Chavez on 17/01/2017.
//
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet var rightImageView: UIImageView!
    @IBOutlet var mainAppLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
