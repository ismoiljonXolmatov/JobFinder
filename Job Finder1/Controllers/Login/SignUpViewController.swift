//
//  SignUpViewController.swift
//  Job Finder1
//
//  Created by Apple on 19.08.1444 (AH).
//

import UIKit
import SafariServices

class SignUpViewController: UIViewController {

    
    private func openFaceBook() {
        if let url = URL(string: "https://www.facebook.com") {
        let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)
        }
    }
    
    private func openGoogle() {
        if let url = URL(string: "https://accounts.google.com/signup") {
        let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)
        }
    }
    
    
    
    @IBAction func openFaceBookButton(_ sender: Any) {
        openFaceBook()
    }
    
    @IBAction func openGoogleButton(_ sender: Any) {
        openGoogle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      }
    
    @IBAction func signUpButton(_ sender: Any) {
        let vc = TabBarViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func signInButton(_ sender: Any) {
        let vc = SignInViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalPresentationStyle = .fullScreen
        vc.title = "SignIn"
        present(vc, animated: true)
        
    }
    
    }
