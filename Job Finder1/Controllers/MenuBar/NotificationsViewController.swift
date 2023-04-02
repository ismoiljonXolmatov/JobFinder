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
   
}
