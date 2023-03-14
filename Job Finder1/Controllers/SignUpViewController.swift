//
//  SignUpViewController.swift
//  Job Finder1
//
//  Created by Apple on 19.08.1444 (AH).
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet var backButton: UIButton!
    
    @IBAction func tapBackButton(_ sender: Any) {
        let vc = SignInViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .partialCurl
        present(vc, animated: true)
 
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      }
    
    @IBAction func signUpButton(_ sender: Any) {
        let vc = ProfileViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .partialCurl
        present(vc, animated: true)
        
    }
    
    @IBAction func signInButton(_ sender: Any) {
        let vc = SignInViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .partialCurl
        vc.title = "SignIn"
        present(vc, animated: true)
    }
    
    }
