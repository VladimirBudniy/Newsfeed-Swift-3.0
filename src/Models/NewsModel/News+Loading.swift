//
//  News+Loading.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/10/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation
import Alamofire
import ReactiveCocoa
import ReactiveSwift

extension News {
    
    static func loadNews(for category: String) -> SignalProducer<[News], NSError> {
        return SignalProducer { (observer, compositeDisposable) in
            Alamofire.request("http://tsn.ua/rss").responseString { response in
                if let XML = response.result.value {
                    News.parsXML(xml: XML, by: category).startWithResult({ result in
                        observer.send(value: result.value!)
                        observer.sendCompleted()
                    })
                }
            }
        }
    }
    
}
