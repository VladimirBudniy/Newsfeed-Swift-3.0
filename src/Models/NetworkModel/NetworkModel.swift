//
//  NetworkModel.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 12/29/16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

import Foundation
import Alamofire
import ReactiveCocoa
import ReactiveSwift

class NetworkModel {
    
    static func loadNews(for category: String) -> SignalProducer<[News], NSError> {
        return SignalProducer { (observer, compositeDisposable) in
            Alamofire.request("http://tsn.ua/rss").responseString { response in
                if let XML = response.result.value {
                    ParserModel.parsXML(xml: XML, by: category).startWithResult({ result in
                        observer.send(value: result.value!)
                        observer.sendCompleted()
                    })
                }
            }
        }
    }
    
}
