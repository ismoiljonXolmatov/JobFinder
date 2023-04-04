//
//  MenuViewController.swift
//  Job Finder1
//
//  Created by Apple on 29.08.1444 (AH).
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func editProfileButton(_ sender: Any) {
        let vc = EditProfileViewController()
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapBack))
        vc.navigationItem.leftBarButtonItem  = button1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func applacationsButton(_ sender: Any) {
        let vc = ApplacationsViewController()
        navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func logOutButton(_ sender: Any) {
        let vc = SignInViewController()
        present(vc, animated: true)

    }
    
    
    @IBAction func notificationButton(_ sender: Any) {
        let vc = NotificationsViewController()
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapBack))
        vc.navigationItem.leftBarButtonItem  = button1
        vc.navigationItem.leftBarButtonItem?.tintColor = .label
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapBack))
        self.navigationItem.leftBarButtonItem  = button1
        navigationItem.leftBarButtonItem?.tintColor = .label
        navigationItem.largeTitleDisplayMode = .never
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

    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
 
