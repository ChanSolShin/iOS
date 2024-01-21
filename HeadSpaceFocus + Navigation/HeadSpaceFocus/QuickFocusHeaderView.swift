//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by 신찬솔 on 1/20/24.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String) {
        titleLabel.text = title
    }
}
