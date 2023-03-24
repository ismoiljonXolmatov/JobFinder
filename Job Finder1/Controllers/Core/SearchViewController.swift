//
//  SearchViewController.swift
//  Job Finder1
//
//  Created by Apple on 27.08.1444 (AH).
//

import UIKit

class SearchViewController: UIViewController {

    static func UIColorFromRGBSearch(rgbValue: UInt) -> UIColor {
       return UIColor(
           red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
           green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
           blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
           alpha: CGFloat(1.0)
       )
   }
    
    let companies: [String] = ["Facebook","Dribbble","Google","Shopify","Netflix"]
    let saleries: [String] = ["$4500/m","$6000/m","$4500/m","$1200/m","$1200/m"]
    let locations: [String] = ["Toronto, Canada","Toronto, Canada","New York, USA","New York, USA","South Korea, Seul"]
    let workTimes: [String] = ["06h","12h","24h", "24h","16h"]
    let jobTypes: [String] = ["UI/UX Designer","Product Designer","Senior Ux Designer","Visual Designer","Visual Designer"]

    
    var companyIcons: [UIImage?] = [
        UIImage(named: "Facebook"),
        UIImage(named: "Dribble"),
        UIImage(named: "google 1"),
        UIImage(named: "spotify"),
        UIImage(named: "netflix")
    ]
    let bacgroundColors: [UIColor] = [
        UIColorFromRGBSearch(rgbValue: 0x1445B4),
        UIColorFromRGBSearch(rgbValue: 0xFFD4E5),
        UIColorFromRGBSearch(rgbValue: 0xFAFAFA),
        UIColorFromRGBSearch(rgbValue: 0xC9FCDB),
        UIColorFromRGBSearch(rgbValue: 0x101010)
    ]
        
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: customCollectionviewLayout())
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SearchViewController.UIColorFromRGBSearch(rgbValue: 0xD7D7D7)
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .systemGray6
        collectionView.register(searchcollectionviewCell.self, forCellWithReuseIdentifier: searchcollectionviewCell.identifier)
        title = "Search"
        navigationItem.largeTitleDisplayMode = .never
        let button = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didtabBack))
        navigationItem.leftBarButtonItem = button
        view.addSubview(collectionView)
        addConstraints()
    }
    
    private func addConstraints() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray6
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 230),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
    @objc func didtabBack() {
        self.navigationController?.popViewController(animated: true)
    }
    static func customCollectionviewLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1/4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchcollectionviewCell.identifier, for: indexPath) as? searchcollectionviewCell else  {
            return UICollectionViewCell()
        }
        let companyicon = companyIcons[indexPath.row]
        let companyName = companies[indexPath.row]
        let backGroundColor = bacgroundColors[indexPath.row]
        let job = jobTypes[indexPath.row]
        let salery = saleries[indexPath.row]
        let location = locations[indexPath.row]
        let workTime = workTimes[indexPath.row]
        cell.imageView.image = companyicon
        cell.companyLabel.text = companyName
        cell.jobTypeLabel.text = job
        cell.caleryLabel.text = salery
        cell.locationLabel.text = location
        cell.timeLabel.text = workTime
        cell.imageView.backgroundColor = backGroundColor
        return cell
    }
    
}

