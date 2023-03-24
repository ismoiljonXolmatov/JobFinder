//
//  LaunchViewController.swift
//  Job Finder1
//
//  Created by Apple on 19.08.1444 (AH).
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func letsStartButton(_ sender: Any) {
        let vc = SignInViewController()
        vc.title = "Sign in"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .partialCurl
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
}
