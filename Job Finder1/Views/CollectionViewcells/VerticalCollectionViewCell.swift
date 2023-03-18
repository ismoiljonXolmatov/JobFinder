//
//  VerticalCollectionViewCell.swift
//  Job Finder1
//
//  Created by Apple on 21.08.1444 (AH).
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VerticalCollectionViewCell"
    
    public var companyImage: UIImageView = {
       var imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Facebook")
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    public var jobLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lead Product Manager"
        label.font = UIFont(name: "poppins", size: 16)
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    private let seleryLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "poppins", size: 12)
        label.text = "$4500/m"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
       public var  fullTimeLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "poppins", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Full Time"
        label.textColor = .gray
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(companyImage)
        contentView.addSubview(jobLabel)
        contentView.addSubview(seleryLb)
        contentView.addSubview(fullTimeLb)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .tertiarySystemBackground
        addConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            companyImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            companyImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            companyImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            companyImage.widthAnchor.constraint(equalToConstant: 50),

            jobLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            jobLabel.leadingAnchor.constraint(equalTo: companyImage.trailingAnchor, constant: 20),
            
            fullTimeLb.leadingAnchor.constraint(equalTo: companyImage.trailingAnchor, constant: 20),
            fullTimeLb.topAnchor.constraint(equalTo: jobLabel.bottomAnchor, constant: 7),
            
            seleryLb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            seleryLb.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 34)
            
        ])
    }
    
    
}
