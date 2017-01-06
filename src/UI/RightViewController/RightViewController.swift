//
//  RightViewController.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 12/29/16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

import UIKit
import MagicalRecord

class RightViewController: UIViewController, ViewControllerRootView, UITableViewDataSource, UITableViewDelegate {

    typealias RootViewType = RightMenuView
    
    var tableView: UITableView? {
        return self.rootView.tabelView
    }
    
    let categoryItems = Array(CategoriesStore.keys)
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCellWithIdentifier(identifier: String(describing: RightMenuCell.self))
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoriesStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RightMenuCell.self)) as! RightMenuCell
        let category = self.categoryItems[indexPath.row]
        cell.fillWithCategory(category: category, imageName: CategoriesLogo[category]!)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        self.changeMainViewControllerFor(category: self.categoryItems[indexPath.row])
    }
    
    // MARK: - Private

    private func changeMainViewControllerFor(category: String) {
        let controller = MainViewController()
        controller.barTitle = category
        self.slideMenuController()?.changeMainViewController(UINavigationController(rootViewController: controller), close: true)
    }
    
    private func registerCellWithIdentifier(identifier: String) {
        self.tableView?.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
