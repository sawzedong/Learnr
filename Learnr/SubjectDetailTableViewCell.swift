//
//  SubjectDetailTableViewCell.swift
//  Learnr
//
//  Created by Shaw Sheng Saw on 20/9/20.
//  Copyright © 2020 Techiaki. All rights reserved.
//

import UIKit

class SubjectDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var homeworkNameLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var completionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 12
        containerView.backgroundColor = UIColor(
            red: (143.0/255.0),
            green: (133.0/255.0),
            blue: (226.0/255.0),
            alpha: 1
        )
    }
//   RGB values for purple theme: 143, 133, 226

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
