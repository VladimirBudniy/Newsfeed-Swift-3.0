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
    
    @IBOutlet weak var view: UIView!

    
    // MARK: - Public
    
    func fillWith(news: News?) {
        
//        self.scrollView.contentSize.height = 10000
        
        if let news = news {
            self.titleLabel.text = news.title
            self.titleLabel.sizeToFit()
            self.timeLabel.text = Date.correctStringDateFor(date: news.pubDate! as Date)
            self.fullTextLabel.text = news.fullText
            self.fullTextLabel.sizeToFit()

//            self.view.frame.size.height = self.fullTextLabel.frame.size.height + 500
//            self.scrollView.contentSize.height = self.fullTextLabel.frame.size.height + 1000
            
            print("label frame - \(self.fullTextLabel.frame.size.height)")
            print("view frame - \(self.view.frame.size.height)")
            print("scroll frame - \(self.scrollView.contentSize.height)")
            
            
            self.newsImageView?.sd_setImage(with: URL(string: news.urlString!),
                                            completed: ({ image, error, cacheType, imageURL in
//                                                print(image!)
                                            }))
        }
    }
    
    // MARK: Private
    
}
