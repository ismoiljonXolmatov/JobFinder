//
//  NotificationsViewController.swift
//  Job Finder1
//
//  Created by Bismillah on 11.09.1444 (AH).
//

import UIKit

class NotificationsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    let datas: [String] = [
        "New Post", "Got Hired", "Get Rejected", "Message", "Call", "Dark Mode"
    ]
    
    let definition: [String] = [
    "If any new post update", "If you get hired any company", "If you rejected by any company", "Got any new massage", "Have a call", "Enable dark theme"
    ]
    
    private let notifTableView: UITableView = {
       let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.identifier)
        return tableView
    }()
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
       return UIColor(
           red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
           green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
           blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
           alpha: CGFloat(1.0)
       )
   }
     override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(notifTableView)
        notifTableView.frame = view.bounds
        notifTableView.delegate = self
        notifTableView.dataSource = self
        notifTableView.separatorStyle = .none
        notifTableView.allowsSelection = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        setNeedsStatusBarAppearanceUpdate()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier, for: indexPath) as? NotificationTableViewCell else {
            return UITableViewCell()
        }
        cell.bigLb.text = datas[indexPath.row]
        cell.littleLb.text = definition[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       80
    }


    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // Create a footer view with the same background color as the table view to create the illusion of space between the cells
        let footerView = UIView()
        footerView.backgroundColor = tableView.backgroundColor
        return footerView
    }
  
}
