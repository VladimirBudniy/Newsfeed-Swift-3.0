//
//  News+Parser.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/10/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation
import SWXMLHash
import MagicalRecord
import ReactiveCocoa
import ReactiveSwift

extension News {
    
    static func parsXML(xml: String, by category: String) -> SignalProducer<[News], NSError> {
        return SignalProducer { (observer, compositeDisposable) in
            MagicalRecord.save({ context in
                let newsXML = SWXMLHash.parse(xml)
                for index in 1...700 {
                    let news = News.mr_createEntity(in: context)
                    news?.fullText = replace(newsXML["rss"]["channel"]["item"][index]["fulltext"].element?.children[1].description)
                    news?.newsCategory = replace(newsXML["rss"]["channel"]["item"][index]["category"].element?.children[1].description)
                    news?.title = replace(newsXML["rss"]["channel"]["item"][index]["title"].element?.children[1].description)
                    news?.pubDate = convertDate(newsXML["rss"]["channel"]["item"][index]["pubDate"].element!.text)
                    news?.urlString = newsXML["rss"]["channel"]["item"][index]["enclosure"].element!.attribute(by: "url")?.text
                }
            }, completion: { (saved, error) in
                if error == nil {
                    var news = [News]()
                    if CategoriesForSearch[category] == "Всі новини" {
                        news = News.mr_findAllSorted(by: "pubDate", ascending: false, in: NSManagedObjectContext.mr_default()) as! [News]
                    } else {
                        let predicate = NSPredicate(format: "newsCategory = %@", CategoriesForSearch[category]!)
                        news = News.mr_findAllSorted(by: "pubDate", ascending: false, with: predicate, in: NSManagedObjectContext.mr_default()) as! [News]
                    }
                    observer.send(value: news)
                    observer.sendCompleted()
                }
            })
        }
    }
}

fileprivate func replace(_ string: String?) -> String? {
    if let string = string {
        return string.stringReplace(string, ["&quot;", "&#039;", "&#13;"], ["\"", "\'", "\n"])
    }
    
    return nil
}

fileprivate func convertDate(_ string: String?) -> NSDate? {
    if let string = string {
        return Date.convertDateFromString(string: string) as NSDate
    }
    
    return nil
}
