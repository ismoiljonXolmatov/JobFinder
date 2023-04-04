//
//  ApplacationsViewController.swift
//  Job Finder1
//
//  Created by Apple on 02.09.1444 (AH).
//

import UIKit

class ApplacationsViewController: UIViewController {
    
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
       return UIColor(
           red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
           green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
           blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
           alpha: CGFloat(1.0)
       )
   }
    
    
    let companies: [String] = ["Facebook","Dribbble","Google","Shopify"]
    let conditins: [String] = ["Delivered","Delivered","Pending","Pending"]
    let saleries: [String] = ["$4500 Monthly","$1200 Monthly","$1200 Monthly","$1200 Monthly"]
    let locations: [String] = ["Toronto, Canada","Toronto, Canada","New York, USA","New York, USA"]
    let jobTypes: [String] = ["UI/UX Designer","Visual Designer","Senior UI/UX Designer","UI/UX Designer"]

    var companyIcons: [UIImage?] = [
        UIImage(named: "Facebook"),
        UIImage(named: "Dribble"),
        UIImage(named: "google 1"),
        UIImage(named: "spotify"),
    ]
    let bacgroundColors: [UIColor] = [
        UIColorFromRGB(rgbValue: 0xE5EDFF),
        UIColorFromRGB(rgbValue: 0xFFD4E5),
        UIColorFromRGB(rgbValue: 0xFAFAFA),
        UIColorFromRGB(rgbValue: 0xC9FCDB),
    ]
    
    let textColors: [UIColor] = [
        UIColorFromRGB(rgbValue: 0x4460A0),
        UIColorFromRGB(rgbValue: 0xEA4C89),
        UIColorFromRGB(rgbValue: 0x1976D2),
        UIColorFromRGB(rgbValue: 0x1ED760),
    ]
    
    private let applLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 18)
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " Your Applacations"
        return label
    }()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: customLayout())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(collectionView)
        view.addSubview(applLabel)
        title = "Applacations"
        navigationItem.largeTitleDisplayMode = .never
        let button = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapBack))
        navigationItem.leftBarButtonItem = button
        navigationItem.leftBarButtonItem?.tintColor = .label
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
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemGray6
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ApplyCollectionViewCell.self, forCellWithReuseIdentifier: ApplyCollectionViewCell.identifier)
        NSLayoutConstraint.activate([
            applLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            applLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.topAnchor.constraint(equalTo: applLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
 
    static func customLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(180)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)),
            subitems: [item]
        )
        let sectin = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: sectin)
    }
    
    
}

extension ApplacationsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ApplyCollectionViewCell.identifier, for: indexPath) as? ApplyCollectionViewCell else {
            return UICollectionViewCell()
        }
        let companyicon = companyIcons[indexPath.row]
        let companyName = companies[indexPath.row]
        let backGroundColor = bacgroundColors[indexPath.row]
        let condition = conditins[indexPath.row]
        let textColor = textColors[indexPath.row]
        let job = jobTypes[indexPath.row]
        let salery = saleries[indexPath.row]
        let location = locations[indexPath.row]
        cell.imageView.image = companyicon
        cell.conditionButton.setTitle(condition, for: .normal)
        cell.conditionButton.backgroundColor = backGroundColor
        cell.conditionButton.setTitleColor(textColor, for: .normal)
        cell.saleryLabel.textColor = textColor
        cell.companyLabel.text = companyName
        cell.jobTypeLabel.text = job
        cell.saleryLabel.text = salery
        cell.locationLabel.text = location
        cell.imageView.backgroundColor = backGroundColor
        return cell

        
    }
}
