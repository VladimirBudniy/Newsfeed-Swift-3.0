//
//  SlideMenuController+Init.swift
//  Cagdas
//
//  Created by Artem Chabannyi on 9/27/16.
//  Copyright © 2016 IDAP Group. All rights reserved.
//

import Foundation
import SlideMenuControllerSwift

extension SlideMenuController {
    
    /** Create SlideMenuController with predefined controller
     */
    static func initSlideMenuController() -> SlideMenuController {
        
        let screenWidth = UIScreen.main.bounds.width
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.leftViewWidth = screenWidth * 0.8
        SlideMenuOptions.rightViewWidth = screenWidth * 0.65
        SlideMenuOptions.panFromBezel = false
        SlideMenuOptions.rightPanFromBezel = false
        SlideMenuOptions.hideStatusBar = false
        SlideMenuOptions.contentViewOpacity = 0
        SlideMenuOptions.contentViewDrag = false
        
        let mainViewController = UINavigationController(rootViewController: MainViewController())
        let slideMenuController =  SlideMenuController(mainViewController: mainViewController,
                                                       rightMenuViewController: RightViewController())
        // Disable right menu pan gesture
        slideMenuController.view.removeGestureRecognizer(slideMenuController.rightPanGesture!)
        slideMenuController.rightPanGesture = nil
        
        return slideMenuController
    }
    
}
