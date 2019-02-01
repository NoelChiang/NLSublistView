//
//  NLSubListTitleTableViewCell.swift
//  UI_DetailListTableview
//
//  Created by Noel on 2019/1/23.
//  Copyright © 2019 Noel. All rights reserved.
//

import UIKit

class NLSubListTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
