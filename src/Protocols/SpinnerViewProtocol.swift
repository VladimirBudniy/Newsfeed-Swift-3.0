//
//  SpinnerViewProtocol.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/3/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation
import UIKit

protocol SpinnerViewProtocol {
    
    var spinner: SpinnerView? { set get }
    
}

extension SpinnerViewProtocol where Self : UIView {
    
    var spinner: SpinnerView {
        return self.spinner
    }
    
    mutating func showSpinnerOn(rootView: UIView) {
        var view = self.spinner
        if view == nil {
            view = SpinnerView.loadSpinner()
            self.spinner = view
            view?.frame = self.frame
            view?.spinner.startAnimating()
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            view?.alpha = 0.6
            rootView.addSubview(view!)
        })
    }
    
    mutating func removeSpinnerView() {
        let view = self.spinner
        UIView.animate(withDuration: 1.0, animations: {
            view?.alpha = 0.1
        }, completion: { loaded in
            if loaded {
                self.removeFromSuperview()
                self.spinner = nil;
            }
        })
    }

    
}
