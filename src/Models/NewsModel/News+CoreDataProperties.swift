//
//  News+CoreDataProperties.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/3/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News");
    }

    @NSManaged public var fullText: String?
    @NSManaged public var newsCategory: String?
    @NSManaged public var pubDate: NSDate?
    @NSManaged public var title: String?
    @NSManaged public var urlString: String?

}
