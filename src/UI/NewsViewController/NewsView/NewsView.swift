//
//  NewsView.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/10/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit
import SDWebImage

class NewsView: LoadingView {
    @IBOutlet var scrollView: UIScrollView?
    @IBOutlet var newsImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var timeLabel: UILabel?
    @IBOutlet var fullTextLabel: UILabel?
    
    @IBOutlet var backView: UIView?
    @IBOutlet var timeView: UIView?
    
    // MARK: - Public
    
    func fillWith(news: News?) {
        if let news = news {
            self.fullTextLabel?.text = news.fullText
            self.fullTextLabel?.sizeToFit()
            self.updateConstraintsOfCurrentView()
            
            self.titleLabel?.text = news.title
            self.titleLabel?.sizeToFit()
            self.timeLabel?.text = Date.correctStringDateFor(date: news.pubDate! as Date)
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
        let newConstraint = NSLayoutConstraint(item: self.backView!,
                                               attribute: NSLayoutAttribute.height,
                                               relatedBy: NSLayoutRelation.equal,
                                               toItem: nil,
                                               attribute: NSLayoutAttribute.notAnAttribute,
                                               multiplier: 1,
                                               constant: self.viewHeight())
        let constraints = (self.backView?.constraints)!
        self.backView?.removeConstraint(constraints[0])
        self.backView?.addConstraint(newConstraint)
        self.backView?.updateConstraints()
    }
    
    private func viewHeight() -> CGFloat {
        let superViewHeight = self.frame.size.height
        let currentViewHeight = (self.fullTextLabel?.frame.size.height)! + (self.fullTextLabel?.frame.origin.y)!
        
        if currentViewHeight < superViewHeight {
            return superViewHeight * 1.1
        }
        
        return currentViewHeight * 1.2
    }
}
