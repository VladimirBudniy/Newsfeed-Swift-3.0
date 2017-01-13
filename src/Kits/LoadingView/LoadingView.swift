//
//  LoadingView.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/3/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    var spinner: SpinnerView?
    
    // MARK: - Public
    
    public func showSpinner(color: UIColor = UIColor.white) {
        var view = self.spinner
        if view == nil {
            view = SpinnerView.loadSpinner()
            view?.spinner?.color = color
            self.spinner = view
            view?.frame = self.frame
            view?.spinner?.startAnimating()
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            view?.alpha = 0.6
            self.addSubview(view!)
        })
    }
    
    public func showBlackSpinner() {
        self.showSpinner(color: UIColor.black)
    }
    
    public func removeSpinnerView() {
        let view = self.spinner
        UIView.animate(withDuration: 1.0, animations: {
            view?.alpha = 0.1
        }, completion: { loaded in
            if loaded {
                view?.removeFromSuperview()
                self.spinner = nil;
            }
        })
    }
    
}
