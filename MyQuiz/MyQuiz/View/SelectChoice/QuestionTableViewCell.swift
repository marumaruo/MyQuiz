//
//  QuestionTableViewCell.swift
//  MyQuiz
//
//  Created by 荒木 敦 on 2016/07/23.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
