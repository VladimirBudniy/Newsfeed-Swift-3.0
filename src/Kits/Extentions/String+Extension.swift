//
//  String+Extension.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 4/5/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation

extension String {
    func stringByRemovingAll(characters: [Character]) -> String {
        return String(self.characters.filter({ !characters.contains($0) }))
    }
    
    func stringReplace(_ string: String?, _ removingChars: [String], _ addingChars: [String]) -> String {
        if let string = string {
            var resultString = string
            for i in 0..<addingChars.count {
                resultString = resultString.replacingOccurrences(of: removingChars[i], with: addingChars[i])
            }
            
            return resultString
        }
        
        return ""
    }
    
    func stringRemove(_ string: String, _ subStrings: [String]?, _ onString: String) -> String {
        var resultString = string
        _ = subStrings.map { $0.flatMap { resultString = resultString.replacingOccurrences(of: $0, with: onString) } }
        
        return resultString
    }
}
