//
//  CellViewCell.swift
//  AlomofireSwiftyJson
//
//  Created by admin on 12/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit

class CellViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var street: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
