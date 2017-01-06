//
//  MainViewController.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 12/29/16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa


class MainViewController: UIViewController, ViewControllerRootView, UITableViewDataSource, UITableViewDelegate {
    
    typealias RootViewType = MainView

    var barTitle: String = "Всі новини"
    
    var news: Array<News>? {
        didSet {
            self.reloadView()
        }
    }
    
    var tableView: UITableView? {
        return self.rootView.tabelView
    }
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingNavigationBar()
        self.addRefreshControl()
        self.registerCellWithIdentifier(identifier: String(describing: MainViewCell.self))
        self.loadNews(for: self.barTitle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        cleanCache()
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainViewCell.self)) as! MainViewCell
        cell.fillWithNews(news: (self.news?[indexPath.row])!)
        
        return cell
    }

    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    // MARK: - Private
    
    private func reloadView() {
        self.tableView?.reloadData()
        self.tableView?.refreshControl?.endRefreshing()
        self.rootView.removeSpinnerView()
    }
    
    private func addRefreshControl() {
        let control = UIRefreshControl()
        
        // must add extension for UIRefreshControl
        let attribute = [NSForegroundColorAttributeName: UIColor.white,
                         NSFontAttributeName: UIFont(name: "HelveticaNeue-Medium", size: 14)!]
        control.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: attribute)
        control.tintColor = UIColor.white
        
        control.addTarget(self, action: #selector(load), for: UIControlEvents.valueChanged)
        self.tableView?.refreshControl = control
    }
    
    private func registerCellWithIdentifier(identifier: String) {
        self.tableView?.register(UINib(nibName: identifier, bundle: nil),
                                 forCellReuseIdentifier: identifier)
    }
    
    private func settingNavigationBar() {
        
        ////////////////////////////////////////////////////////////////////////////////////
        let navigationItem = self.navigationItem
        navigationItem.title = self.barTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "categories")!,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(onOpenRight))
        
        
        // must add extension for UINavigationBar
        let attribute = [NSForegroundColorAttributeName: UIColor.white,
                         NSFontAttributeName: UIFont(name: "HelveticaNeue-Medium", size: 16)!]
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.titleTextAttributes = attribute
        navigationBar?.tintColor = UIColor.white
        navigationBar?.backgroundColor = UIColor.clear
        navigationBar?.shadowImage = UIImage()
        navigationBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        
    }
    
    @objc private func onOpenRight() {
        self.slideMenuController()?.openRight()
    }
    
    @objc private func load() {  ///////////////////////////////////////////////////
        self.loadNews(for: self.barTitle)
    }
    
    private func loadNews(for category: String) {
        self.rootView.showSpinner()
        LoadModel.loadNewsByCategory(category: category)
            .observe(on: UIScheduler())
            .startWithResult({ result in
                self.news = result.value
            })
    }

}

