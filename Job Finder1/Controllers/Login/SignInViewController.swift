//
//  SignInViewController.swift
//  Job Finder1
//
//  Created by Apple on 19.08.1444 (AH).
//
import SafariServices

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
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
