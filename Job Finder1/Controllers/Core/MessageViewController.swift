//
//  MessageViewController.swift
//  Job Finder1
//
//  Created by Apple on 24.08.1444 (AH).
//

import UIKit

class MessageViewController: UIViewController {
    
    
     func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    let names: [String] = ["Rozanne Barrientes","Anaya Sanji","Elizabeth Olsen","Tony Stark","Banner","Steave","Thor","Natasha","Hak Eye"]
    
    let messages: [String] = ["A wonderful serenity has taken...","AWhat about Paypal?","We shoud move forword to talk with....","Let’s have a call for a future projects...","I don’t think i can fit on this ui we should....","Move in some special work recently so.....","You shoud be a avenger i thing the.....","I am going to die in avengers endgame.....","I have to save natasha in endgame....."]

    
      var profileimages: [UIImage?] = [
        UIImage(named: "Avatar"),
        UIImage(named: "Avatar1"),
        UIImage(named: "Avatar2"),
        UIImage(named: "Avatar3"),
        UIImage(named: "Avatar4"),
        UIImage(named: "Avatar5"),
        UIImage(named: "Avatar6"),
        UIImage(named: "Avatar7"),
        UIImage(named: "Avatar8"),
    ]
    
    
    @IBOutlet var messageTableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Message"
        let button1 = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem  = button1
        navigationItem.rightBarButtonItem?.tintColor = .label
        navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.messageTableView.separatorColor = UIColor.clear
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.dataSource = self
        messageTableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.identifier)
    }
}

extension MessageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.identifier, for: indexPath) as? MessageTableViewCell else {
            return UITableViewCell()
        }
        let name = names[indexPath.row]
        let message = messages[indexPath.row]
        let image = profileimages[indexPath.row]
        cell.messageLabel.text = message
        cell.nameLabel.text = name
        cell.userProfileImageView.image = image
        if indexPath.row == 0 {
            cell.unreadNumberIMV.image = UIImage(named: "2")
        } else if indexPath.row == 1 {
            cell.unreadNumberIMV.image = UIImage(named: "1")
        } else {
            cell.unreadNumberIMV.isHidden = true
        }
        cell.backgroundColor = .systemGray6
        cell.userProfileImageView.layer.cornerRadius = 25
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let filterAction = UIContextualAction(style: .normal, title: "Delete") { (action, view, bool) in
            }
            filterAction.backgroundColor = UIColor.systemRed
            return UISwipeActionsConfiguration(actions: [filterAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ChatViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.topImageView.image = profileimages[indexPath.row]
        vc.title = names[indexPath.row]
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
        navigationController?.pushViewController(vc, animated: true)
    }

}
