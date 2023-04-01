//
//  ProfileViewController.swift
//  Job Finder1
//
//  Created by Apple on 20.08.1444 (AH).
//

import UIKit

class ProfileViewController: UIViewController {
    
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
       return UIColor(
           red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
           green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
           blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
           alpha: CGFloat(1.0)
       )
   }
    
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
    
    let jobs: [String] = ["Lead Product Manager","Senior UI Designer","Visual Designer"]
    
    let companies: [String] = ["Google","Spotify","Netflix"]

    var companyImages: [UIImage?] = [
      UIImage(named: "google 1"),
      UIImage(named: "spotify"),
      UIImage(named: "netflix"),
  ]
    let bacgroundColors: [UIColor] = [
        UIColorFromRGB(rgbValue: 0xE4F2FF),
        UIColorFromRGB(rgbValue: 0xE5FFEF),
        UIColorFromRGB(rgbValue: 0x101010),
      ]
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        navigationItem.largeTitleDisplayMode = .never
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false

        verticalCollectionView.dataSource = viewModel
        verticalCollectionView.delegate = viewModel
        verticalCollectionView.showsVerticalScrollIndicator = false
        collectionView.register(ProfileHorizontalCVC.self, forCellWithReuseIdentifier: ProfileHorizontalCVC.identifier)
        verticalCollectionView.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: VerticalCollectionViewCell.identifier)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companyImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileHorizontalCVC.identifier, for: indexPath) as? ProfileHorizontalCVC else {
            return UICollectionViewCell()
        }
        cell.imageView.image = companyImages[indexPath.row]
        cell.jobLabel.text = jobs[indexPath.row]
        cell.imageView.backgroundColor = bacgroundColors[indexPath.row]
        cell.googleLb.text = companies[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = ApplyVC()
        vc.modalPresentationStyle = .popover
        vc.jobLabel.text = jobs[indexPath.row]
        vc.companyLabel.text = companies[indexPath.row]
        vc.companyIamgeView.image = companyImages[indexPath.row]
        vc.companyIamgeView.backgroundColor = bacgroundColors[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
  }

