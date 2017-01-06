//
//  LeftMenuViewController.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 12/29/16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController, ViewControllerRootView, UITableViewDataSource, UITableViewDelegate {
    
    typealias RootViewType = LeftMenuView
    
    var tableView: UITableView {
        return self.rootView.tabelView
    }
    
    let categories: Array<String> = ["Всі новини",
                                     "Новини України",
                                     "Новини АТО",
                                     "Новини Києва",
                                     "Новини світу",
                                     "Політика",
                                     "Фінанси",
                                     "Новини науки та IT",
                                     "Світськи новини",
                                     "Спорт",
                                     "Цікавинки",
                                     "Допомога"]
    
    let namesImages: Array<String> = ["home",
                                     "news_ukraine",
                                     "news_ATO",
                                     "kiev",
                                     "world_news",
                                     "politics",
                                     "business",
                                     "it",
                                     "celeb",
                                     "sport",
                                     "joker",
                                     "health"]
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCellWithIdentifier(identifier: String(describing: LeftMenuCell.self))
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LeftMenuCell.self)) as! LeftMenuCell
        cell.fillWithCategory(category: self.categories[indexPath.row], imageName: self.namesImages[indexPath.row])
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    // MARK: - Private
    
    func shadowView(shadowOpacity: Float) {
//        let layer = self.rootView.layer
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowOffset = CGSize(width: 4, height: 0)
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(rect: layer.bounds).cgPath
    }
    
    private func registerCellWithIdentifier(identifier: String) {
        self.tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
}
