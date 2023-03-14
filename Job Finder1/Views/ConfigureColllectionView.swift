//
//  ConfigureColllectionView.swift
//  Job Finder1
//
//  Created by Apple on 21.08.1444 (AH).
//

import UIKit

class ConfigureColllectionView: UIView, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionViewCell.identifier, for: indexPath) as? VerticalCollectionViewCell else {
            return UICollectionViewCell()
        }
        if indexPath.row == 0 {
            cell.companyImage.image = UIImage(named: "Facebook")
            cell.jobLabel.text = "UI/UX Designer"
            cell.companyImage.contentMode = .scaleAspectFill
        }
        else if indexPath.row == 1 {
            cell.companyImage.image = UIImage(named: "spotify")
            cell.jobLabel.text = "Product Designer"
            cell.companyImage.contentMode = .center


        }
        else if indexPath.row == 2 {
            cell.companyImage.image = UIImage(named: "netflix")
            cell.jobLabel.text = "Visual Designer"
            cell.companyImage.backgroundColor = .label
            cell.companyImage.contentMode = .center
        }
        return cell
    }
}
