//
//  ItemTableViewCell.swift
//  AddMinusCount
//
//  Created by Javier Calderon Jr. on 12/17/19.
//  Copyright © 2019 SelfLearning. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var decrementButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
