//
//  SpinnerView.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/3/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit

class SpinnerView: UIView {
    
    @IBOutlet var spinner: UIActivityIndicatorView?

    // MARK: - Public
    
    static func loadSpinner() -> SpinnerView? {
        let nib = UINib(nibName: String(describing: SpinnerView.self), bundle: Bundle.main)
        let views = nib.instantiate(withOwner:self, options: nil) as! [SpinnerView]
        for view in views {
            if view.isMember(of: SpinnerView.self) {
                return view
            }
        }
        
        return nil
    }
}
