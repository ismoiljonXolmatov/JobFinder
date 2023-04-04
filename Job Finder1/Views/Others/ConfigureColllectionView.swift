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
    
    let jobs: [String] = ["$UI/UX Designer","Product Designer","Visual Designer","Visual Designer"]
    
    let saleries: [String] = ["$4500/m","$6000/m","$3800/m","$1200/m"]

    let workTime: [String] = ["Full Time","Full Time","10 hour", "6 hour"]

    var companyImages: [UIImage?] = [
      UIImage(named: "Facebook"),
      
      UIImage(named: "spotify"),
      
      UIImage(named: "netflix"),
      
      UIImage(named: "Spotify 1"),
  ]
    
    let bacgroundColors: [UIColor] = [
        UIColorFromRGB(rgbValue: 0x1445B4),
        UIColorFromRGB(rgbValue: 0xE5FFEF),
        UIColor.label,
        UIColorFromRGB(rgbValue: 0xE4F2FF),
        
      ]
    
    public weak var delegate: ConfigureColllectionViewDeleagte?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        workTime.count
        
    }
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
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
        cell.companyImage.image = companyImages[indexPath.row]
        cell.jobLabel.text = jobs[indexPath.row]
        cell.companyImage.backgroundColor = bacgroundColors[indexPath.row]
        cell.companyImage.contentMode = .center
        cell.workTime.text = workTime[indexPath.row]
        cell.seleryLb.text = saleries[indexPath.row]
        return cell
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didTapJob()
    }
    
  
}

