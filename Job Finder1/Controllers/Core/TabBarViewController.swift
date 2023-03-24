//
//  TabBarViewController.swift
//  Job Finder1
//
//  Created by Apple on 24.08.1444 (AH).
//

import UIKit

class TabBarViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.label], for:.selected)
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        setTabs()
    }
    
    private func setTabs() {
        self.tabBar.tintColor = UIColor.label
        let homeVC = ProfileViewController()
        let messageVC = MessageViewController()
        let profileVC = EditProfileViewController()
        let settingsVC = SettingsViewController()
        homeVC.navigationItem.largeTitleDisplayMode = .automatic
        messageVC.navigationItem.largeTitleDisplayMode = .automatic
        profileVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: messageVC)
        let nav3 = UINavigationController(rootViewController: profileVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Messgae", image: UIImage(named: "Massage.fill"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Edit Profile", image: UIImage(systemName: "person.fill"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 4)
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
    }
    
}
