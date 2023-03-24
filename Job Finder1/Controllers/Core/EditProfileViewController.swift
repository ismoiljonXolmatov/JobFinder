//
//  EditProfileViewController.swift
//  Job Finder1
//
//  Created by Apple on 24.08.1444 (AH).
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapCancel))
        self.navigationItem.leftBarButtonItem  = button1
        navigationItem.leftBarButtonItem?.tintColor = .label
        title = "Edit Profile"
        navigationItem.largeTitleDisplayMode = .never
        
    }
    @objc func didTapCancel() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
