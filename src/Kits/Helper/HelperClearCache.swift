//
//  HelperClearCache.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/5/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation
import SDWebImage

func cleanCache() {
    let imageCache = SDImageCache.shared()
    imageCache.clearMemory()
}
