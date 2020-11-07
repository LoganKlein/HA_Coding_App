//
//  ProCell.swift
//  HA_Coding_Ex
//
//  Created by Logan Klein on 11/7/20.
//

import UIKit

class ProCell: UITableViewCell {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var subtitleLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with pro: Pro) {
        titleLbl.text = pro.companyName
        subtitleLbl.text = pro.ratingText
        subtitleLbl.textColor = pro.subtitleColor
    }
}
