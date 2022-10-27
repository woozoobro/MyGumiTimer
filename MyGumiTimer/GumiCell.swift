//
//  GumiCell.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2022/10/27.
//

import UIKit

class GumiCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var gumiCountLabel: UILabel!    
    @IBOutlet weak var gumiImageView: UIImageView!
    
    
    func configure(date: String, count: String) {
        dateLabel.text = date
        gumiCountLabel.text = count
    }
    
}
