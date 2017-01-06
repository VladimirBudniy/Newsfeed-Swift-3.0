//
//  MainViewCell.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 12/30/16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

import UIKit
import WebImage

class MainViewCell: UITableViewCell {
    
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var dateImageView: UIImageView!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public
    
    func fillWithNews(news: News) {
        
        self.spinner.startAnimating()
        self.spinner.hidesWhenStopped = true
        
        self.dateImageView.image = UIImage.init(named: "time")
        self.titleLabel.text = news.title
        self.pubDateLabel.text = Date.correctStringDateFor(date: news.pubDate! as Date)
        self.imageNews.sd_setImage(with: URL(string: news.urlString!),
                                   completed: ({ image, error, cacheType, imageURL in
                                    self.spinner.stopAnimating()
                                   }))
    }
}
