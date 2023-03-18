//
//  ChatViewController.swift
//  Job Finder1
//
//  Created by Apple on 25.08.1444 (AH).
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet var backButton: UIButton!
    
    public var topImageView: UIImageView = {
       let imageview = UIImageView()
        imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = imageview.height/2
        return imageview
    }()
    @IBAction func backButtoon(_ sender: Any) {
       dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(false, animated: false)
//        view.addSubview(nameLabell)
        view.addSubview(topImageView)
        addConstraints()
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
    
    private func addConstraints() {
        topImageView.layer.cornerRadius = 17.5
        NSLayoutConstraint.activate([
            topImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            topImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 51),
            topImageView.heightAnchor.constraint(equalToConstant: 35),
            topImageView.widthAnchor.constraint(equalToConstant: 35),
            
//            nameLabell.leadingAnchor.constraint(equalTo: topImageView.trailingAnchor, constant: 15),
//            nameLabell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            nameLabell.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -143),

        ])
    }
    
}
