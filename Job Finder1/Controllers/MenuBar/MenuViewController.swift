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
        navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func applacationsButton(_ sender: Any) {
        let vc = ApplacationsViewController()
        navigationController?.pushViewController(vc, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapBack))
        self.navigationItem.leftBarButtonItem  = button1
        navigationItem.leftBarButtonItem?.tintColor = .label
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
 
