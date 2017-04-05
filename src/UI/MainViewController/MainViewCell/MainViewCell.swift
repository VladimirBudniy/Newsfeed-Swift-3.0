//
//  MainViewCell.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 12/30/16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

import UIKit
import SDWebImage

class MainViewCell: UITableViewCell {
    
    @IBOutlet var pubDateLabel: UILabel?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var imageNews: UIImageView?
    @IBOutlet var loadingView: UIView?
    @IBOutlet var spinner: UIActivityIndicatorView?
    @IBOutlet var dateImageView: UIImageView?
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.settingView()
        
    }
    
    // MARK: - Public
    
    func fillWithNews(news: News) {
        self.spinner?.startAnimating()
        self.spinner?.hidesWhenStopped = true

        let label = self.titleLabel
        label?.text = news.title
        label?.sizeToFit()
        
        self.pubDateLabel?.text = Date.correctStringDateFor(date: news.pubDate! as Date)
        self.imageNews?.sd_setImage(with: URL(string: news.urlString!),
                                   completed: ({ image, error, cacheType, imageURL in
                                    self.spinner?.stopAnimating()
                                   }))
    }
    
    // MARK: - Private
    
    private func settingView() {
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.darkGray
        self.selectedBackgroundView = bgColorView
    }
}
