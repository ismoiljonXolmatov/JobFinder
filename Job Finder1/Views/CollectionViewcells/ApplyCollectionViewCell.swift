//
//  ApplyCollectionViewCell.swift
//  Job Finder1
//
//  Created by Apple on 02.09.1444 (AH).
//

import UIKit

class ApplyCollectionViewCell: UICollectionViewCell {
    
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static let identifier = "ApplyCollectionViewCell"
    
    public let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.image = UIImage(named: "Facebook")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    public let ellipsisButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .label
        return button
    }()
    
    public let conditionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delivered", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins", size: 16)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemRed
        return button
    }()
    
    
    public let jobTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "UI/UX Designer"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    
    public let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "FecaBook"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    public let saleryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 16)
        label.textColor = ApplyCollectionViewCell.UIColorFromRGB(rgbValue: 0x4460A0)
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "$4500 Monthly"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    public let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Toronto, Canada"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.layer.cornerRadius = 12
        contentView.layer.cornerRadius = 20
        conditionButton.layer.cornerRadius = 12
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.addSubview(imageView)
        contentView.addSubview(ellipsisButton)
        contentView.addSubview(companyLabel)
        contentView.addSubview(jobTypeLabel)
        contentView.addSubview(saleryLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(conditionButton)
        ellipsisButton.layer.cornerRadius = 10
        addConstraint()
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            
            companyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            companyLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            
            jobTypeLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 0),
            jobTypeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: jobTypeLabel.bottomAnchor, constant: 12),
            locationLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            
            conditionButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 21),
            conditionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            conditionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            conditionButton.heightAnchor.constraint(equalToConstant: 35),
            conditionButton.widthAnchor.constraint(equalToConstant: 135),
            
            saleryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            saleryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -29),
            
            ellipsisButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            ellipsisButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            ellipsisButton.heightAnchor.constraint(equalToConstant: 20),
            ellipsisButton.widthAnchor.constraint(equalToConstant: 20),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
