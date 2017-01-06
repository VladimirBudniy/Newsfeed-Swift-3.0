//
//  LeftMenuCell.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/3/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit

class LeftMenuCell: UITableViewCell {
    @IBOutlet weak var categoryLogo: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillWithCategory(category: String, imageName: String) {
        self.categoryName.text = category
        self.categoryLogo.image = UIImage(named: imageName)
    }
}
