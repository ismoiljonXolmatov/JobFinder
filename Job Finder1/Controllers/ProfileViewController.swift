//
//  ProfileViewController.swift
//  Job Finder1
//
//  Created by Apple on 19.08.1444 (AH).
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCustomLayout())
    
    let collectionViewHeaderFooterReuseIdentifier = "MyHeaderFooterClass"
    
//    init(collectionView: UICollectionView) {
//        self.collectionView = collectionView
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemTeal
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
//        collectionView.register(
//            UIProfileCollectionViewCell.self,
//            forCellWithReuseIdentifier: UIProfileCollectionViewCell.identifier)
//
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 150)
            
        ])
    }
    
    
    required init?(coder Error: NSCoder) {
        super.init(coder: Error)
    }
    
    static func createCustomLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { (section: Int,
                                                            environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let horizontalItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.8),
                    heightDimension: .fractionalHeight(1)))
            
            horizontalItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            
            let horizontalGroupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .fractionalHeight(2/5))
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: horizontalGroupSize,
                subitems: [horizontalItem])
            
            
            let verticalItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.8),
                    heightDimension: .fractionalHeight(1/3)))
            verticalItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
            
            
            let verticalGroupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .fractionalHeight(3/5))
            
            let verticallGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: verticalGroupSize,
                subitems: [verticalItem])
            
            
            let containerGroupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
            
            let containerGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: containerGroupSize,
                subitems: [horizontalGroup, verticallGroup])
            
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            return section
        }
        return layout
    }
    
        
        
        
        
        
        //MARK: - Collection view
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    

