//
//  SignInViewController.swift
//  Job Finder1
//
//  Created by Apple on 19.08.1444 (AH).
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        let vc =  TabBarViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

    @IBAction func creatAccauntButton(_ sender: Any) {
        let vc = SignUpViewController()
        vc.title = "Sign Up"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
