//
//  LoadModel.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/4/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation
import MagicalRecord
import ReactiveSwift
import ReactiveCocoa

class LoadModel {

    static func loadNewsByCategory(category: String) -> SignalProducer<[News], NSError> {
        return SignalProducer { (observer, compositeDisposable) in
            self.loadFromStoreBy(category: CategoriesForSearch[category]!).startWithResult({ result in
                if result.value != nil {
                    observer.send(value: result.value!)
                    observer.sendCompleted()
                } else {
                    self.networkLoadBy(category: category).startWithResult({result in
                        observer.send(value: result.value!)
                        observer.sendCompleted()
                    })
                }
            })
        }
    }
    
    class func loadFromStoreBy(category: String) -> SignalProducer<[News], NSError> {
        return SignalProducer { (observer, compositeDisposable) in
            var request = [News]()
            if category == "Всі новини" {
                request = News.mr_findAllSorted(by: "pubDate", ascending: false, in: NSManagedObjectContext.mr_default()) as! [News]
            } else {
                let predicate = NSPredicate(format: "newsCategory = %@", category)
                request = News.mr_findAllSorted(by: "pubDate", ascending: false, with: predicate, in: NSManagedObjectContext.mr_default()) as! [News]
            }
            
            if request.count != 0 {
                observer.send(value: request)
                observer.sendCompleted()
            } else {
                observer.send(error: NSError(domain: "DataBaseIsClean", code: 0, userInfo: nil))
                observer.sendCompleted()
            }
        }
    }
    
    class func networkLoadBy(category: String) -> SignalProducer<[News], NSError> {
        return SignalProducer { (observer, compositeDisposable) in
            News.deleteAllEntities()
                .flatMap(FlattenStrategy.latest,
                         transform: { result in News.loadNews(for: category)
                })
                .observe(on: UIScheduler())
                .startWithResult( { result in
                    observer.send(value: result.value!)
                    observer.sendCompleted()
                })
        }
    }

}
