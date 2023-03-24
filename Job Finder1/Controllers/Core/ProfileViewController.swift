//
//  ProfileViewController.swift
//  Job Finder1
//
//  Created by Apple on 20.08.1444 (AH).
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet var menuBar: UIButton!
    
    @IBAction func MenuBarButton(_ sender: Any) {
        let vc = MenuViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapJob() {
        let vc = ApplyVC()
        navigationController?.pushViewController(vc, animated: true)
    }
     
    @IBOutlet var filterButton: UIButton!
    
    @IBAction func tapFilterButton(_ sender: Any) {
        let vc = SetFiltersVC()
        vc.title = "Set Filters"
        self.navigationController?.pushViewController(vc, animated: true)
       }
    
    @IBOutlet var collectionView: UICollectionView!
    
     private let viewModel = ConfigureColllectionView()
    
    @IBOutlet var verticalCollectionView: UICollectionView!
    
    var data = [["google 1", "Lead Product Manager"], ["spotify", "Senior UI Designer"], ["netflix", "Visual Designer"]]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        verticalCollectionView.dataSource = viewModel
        verticalCollectionView.delegate = viewModel
        collectionView.register(ProfileHorizontalCVC.self, forCellWithReuseIdentifier: ProfileHorizontalCVC.identifier)
        verticalCollectionView.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: VerticalCollectionViewCell.identifier)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileHorizontalCVC.identifier, for: indexPath) as? ProfileHorizontalCVC else {
            return UICollectionViewCell()
        }
        
        if indexPath.row == 0 {
            cell.imageView.image = UIImage(named: "google 1")
            cell.jobLabel.text = "Lead Product Manager"
            
        } else if indexPath.row == 1 {
            cell.imageView.image = UIImage(named: "spotify")
            cell.googleLb.text = "Spotify"
            cell.imageView.backgroundColor = UIColorFromRGB(rgbValue: 0xE5FFEF)
            cell.jobLabel.text = "Senior UI Designer"
        }
        else if indexPath.row == 2 {
            cell.imageView.image = UIImage(named: "netflix")
            cell.imageView.backgroundColor = .label
            cell.googleLb.text = "Netflix"
            cell.jobLabel.text = "Visual Designer"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = ApplyVC()
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
  }

