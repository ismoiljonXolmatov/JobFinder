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
        navigationItem.leftBarButtonItem?.tintColor = .label
        title = "Edit Profile"
        navigationItem.largeTitleDisplayMode = .never
        
    }
    @objc func didTapCancel() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
