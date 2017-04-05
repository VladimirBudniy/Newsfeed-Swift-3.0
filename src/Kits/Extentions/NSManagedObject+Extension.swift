//
//  NSManagedObject+Extension.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 12/30/16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

import Foundation
import CoreData
import ReactiveCocoa
import ReactiveSwift
import MagicalRecord
import SDWebImage

extension NSManagedObject {
    
    static func deleteAllEntities() -> SignalProducer<Bool, NSError> {
        return SignalProducer{ (observer, compositeDisposable) in
            MagicalRecord.save({ context in
                cleanCache()
                let objects = self.mr_findAll(in: context)
                if let objects = objects {
                    context.mr_deleteObjects(objects as NSFastEnumeration)
                }
            }, completion: { (didSaved, error) in
                if let error = error {
                    observer.send(error: error as NSError)
                } else {
                    observer.send(value: didSaved)
                    observer.sendCompleted()
                }
            })
        }
    }
    
}

