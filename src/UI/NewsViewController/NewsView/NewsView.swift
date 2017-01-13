//
//  NewsView.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/10/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit
import WebImage

class NewsView: LoadingView {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var newsImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var fullTextLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var timeView: UIView!
    
    // MARK: - Public
    
    func fillWith(news: News?) {        
        if let news = news {
            self.fullTextLabel.text = news.fullText
            self.fullTextLabel.sizeToFit()
            self.updateConstraintsOfCurrentView()
            
            self.titleLabel.text = news.title
            self.titleLabel.sizeToFit()
            self.timeLabel.text = Date.correctStringDateFor(date: news.pubDate! as Date)
            self.newsImageView?.sd_setImage(with: URL(string: news.urlString!),
                                            completed: ({ image, error, cacheType, imageURL in
                                                if let error = error {
                                                    print(error)
                                                }
                                            }))
        }
    }
    
    // MARK: Private
    
    private func updateConstraintsOfCurrentView() {
        let newConstraint = NSLayoutConstraint(item: self.backView,
                                               attribute: NSLayoutAttribute.height,
                                               relatedBy: NSLayoutRelation.equal,
                                               toItem: nil,
                                               attribute: NSLayoutAttribute.notAnAttribute,
                                               multiplier: 1,
                                               constant: self.viewHeight())
        let constraints = self.backView.constraints
        self.backView.removeConstraint(constraints[0])
        self.backView.addConstraint(newConstraint)
        self.backView.updateConstraints()
    }
    
    private func viewHeight() -> CGFloat {
        let superViewHeight = self.frame.size.height
        let currentViewHeight = self.fullTextLabel.frame.size.height + self.fullTextLabel.frame.origin.y
        
        if currentViewHeight < superViewHeight {
            return superViewHeight * 1.2
        }
        
        return currentViewHeight * 1.2
    }
}
