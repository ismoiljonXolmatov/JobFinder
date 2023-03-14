//
//  ProfileViewController.swift
//  Job Finder1
//
//  Created by Apple on 20.08.1444 (AH).
//

import UIKit

class ProfileViewController: UIViewController {

     
    @IBOutlet var filterButton: UIButton!
    
    
    @IBAction func tapFilterButton(_ sender: Any) {
        let vc = SetFiltersVC()
        vc.title = "Set Filters"
        present(vc, animated: true)
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
        collectionView.register(ProfileHorizontalCVC.self, forCellWithReuseIdentifier: ProfileHorizontalCVC.identifier)
        verticalCollectionView.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: VerticalCollectionViewCell.identifier)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
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
            cell.googleLb.text = "Shopify"
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
}

