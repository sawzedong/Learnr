//
//  SubjectsCollectionViewCell.swift
//  Learnr
//
//  Created by Shaw Sheng Saw on 16/9/20.
//  Copyright © 2020 Techiaki. All rights reserved.
//

import UIKit

class SubjectsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var subjectLogo: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subjectLabel.text = "Hello World!"
    }
}
