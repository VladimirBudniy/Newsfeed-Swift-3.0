//
//  NewsViewController.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/10/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, ViewControllerRootView {

    typealias RootViewType = NewsView
        
    var news: News?
    
    var barTitle: String = "Всі новини" ////////////////////
    
    var helveticaTextType: String = "HelveticaNeue-Medium"
    
    // MARK: - Initializations and Deallocations
    
    init(news: News?) {
        self.news = news
        super.init(nibName: String(describing: NewsViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(order:)")
    }
    
    // MARK: - Interface Handling
        
    @objc func onBackButton(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.rootView.showBlackSpinner()
        self.rootView.fillWith(news: self.news)
    }

    // MARK: - Private
    
    private func settingNavigationBar() {
        self.customNavigationItem(imageButton: UIImage(named: "back_button")!)
        self.customNavigationBar()
    }
    
    private func customNavigationItem(imageButton: UIImage) {
        let navigationItem = self.navigationItem
        navigationItem.title = self.barTitle
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageButton,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(onBackButton))
    }
    
    private func customNavigationBar() {
        let navigationBar = self.navigationController?.navigationBar
        let attribute = [NSForegroundColorAttributeName: UIColor.white,
                         NSFontAttributeName: UIFont(name: helveticaTextType, size: 16)!]
        navigationBar?.titleTextAttributes = attribute
        navigationBar?.tintColor = UIColor.white
        navigationBar?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }
    
}
