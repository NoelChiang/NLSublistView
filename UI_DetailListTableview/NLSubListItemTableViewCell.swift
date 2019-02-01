//
//  NLSubListItemTableViewCell.swift
//  UI_DetailListTableview
//
//  Created by Noel on 2019/1/23.
//  Copyright © 2019 Noel. All rights reserved.
//

import UIKit

class NLSubListItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
