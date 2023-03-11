//
//  HorizontalCollectionViewCell.swift
//  Job Finder1
//
//  Created by Apple on 19.08.1444 (AH).
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "HorizontalCollectionViewCell"
    
    let containerView: UIView = {
          let view = UIView()
          view.backgroundColor = .white
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
    
    private var firstText: [String] = ["Lead Product Manager", "Senior Designer", "Visual Designer"]
    
    private var secondText: [String] = ["Lead Product Manager", "Senior Designer", "Visual Designer"]
    
     public var cellImagesH: [UIImage?] = [
        UIImage(named: "google 1"),
        UIImage(named: "spotify"),
        UIImage(named: "netflix")
    ]
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
     
    private let firstLb: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    
    }()
    
    private let companyLB: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 16)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    
    }()
    
    private let secondLb: UILabel = {
       let label = UILabel()
        label.text = "Full Time"
        label.font = UIFont(name: "Poppins", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.image = cellImagesH[0]
        contentView.addSubview(imageView)
        contentView.addSubview(firstLb)
        contentView.addSubview(secondLb)
        addConstraints()
        
        
        
        func configureViews() {
            addSubview(containerView)
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }
    }
        
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 15),
            
            firstLb.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            firstLb.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15),
            firstLb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            secondLb.topAnchor.constraint(equalTo: firstLb.bottomAnchor, constant: 5),
            secondLb.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15),
            secondLb.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            secondLb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
        ])
        
    }
    
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

