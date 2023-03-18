//
//  JobApplyCollectionCell.swift
//  Job Finder1
//
//  Created by Apple on 22.08.1444 (AH).
//

import UIKit

class JobApplyCollectionCell: UICollectionViewCell {
    
static let identifier = "JobApplyCollectionCell"
    
    
    public var infoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.setTitle("Description", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .systemGray6
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "poppins", size: 14)
        return button
    }()
    
    private func constraints() {
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
  }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(infoButton)
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
