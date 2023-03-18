//
//  ApplyVC.swift
//  Job Finder1
//
//  Created by Apple on 22.08.1444 (AH).
//

import UIKit

class ApplyVC: UIViewController {
    
    @IBOutlet var myCollectionView: UICollectionView!
    
//    var color1 = hexStringToUIColor("#291150")
    
    
    @IBAction func backButton(_ sender: Any) {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func applyButton(_ sender: Any) {
        
        let vc = FormViewController()
        vc.modalTransitionStyle = .partialCurl
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .systemGray6
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(JobApplyCollectionCell.self, forCellWithReuseIdentifier: JobApplyCollectionCell.identifier)
    }

    }

@IBDesignable class myImageView: UIButton{}
extension myImageView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}

extension ApplyVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobApplyCollectionCell.identifier, for: indexPath) as? JobApplyCollectionCell else {
                return UICollectionViewCell()
            }
            if indexPath.row == 0 {
                cell.infoButton.setTitle("Description", for: .normal)
                cell.infoButton.backgroundColor = UIColorFromRGB(rgbValue: 0x291150)
                cell.infoButton.setTitleColor(.white, for: .normal)
            }
            
            else if indexPath.row == 1 {
                cell.infoButton.setTitle("Company", for: .normal)
                cell.infoButton.backgroundColor = .tertiarySystemBackground
                cell.infoButton.setTitleColor(.label, for: .normal)
                
            }
            else if indexPath.row == 2 {
                cell.infoButton.setTitle("Reviews", for: .normal)
                cell.infoButton.backgroundColor = .tertiarySystemBackground
                cell.infoButton.setTitleColor(.label, for: .normal)
            }
            return cell
        }
    }


