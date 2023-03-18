//
//  ConfigureColllectionView.swift
//  Job Finder1
//
//  Created by Apple on 21.08.1444 (AH).
//

import UIKit


protocol ConfigureColllectionViewDeleagte: AnyObject {
    func didTapJob()
}
class ConfigureColllectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    public weak var delegate: ConfigureColllectionViewDeleagte?
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
            cell.companyImage.backgroundColor = UIColorFromRGB(rgbValue: 0xE5FFEF)
        
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
    
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didTapJob()
    }
    
  
}

