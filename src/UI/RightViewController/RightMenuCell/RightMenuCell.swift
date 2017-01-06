//
//  RightMenuCell.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/4/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit

class RightMenuCell: UITableViewCell {

    @IBOutlet var categoryLogo: UIImageView?
    @IBOutlet var categoryName: UILabel?
    
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Public
    
    func fillWithCategory(category: String, imageName: String) {
        self.categoryName?.text = category
        self.categoryLogo?.image = UIImage(named: imageName)
    }
    
}
