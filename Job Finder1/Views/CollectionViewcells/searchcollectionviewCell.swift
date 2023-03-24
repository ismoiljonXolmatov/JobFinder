//
//  searchcollectionviewCell.swift
//  Job Finder1
//
//  Created by Apple on 28.08.1444 (AH).
//

import UIKit

class searchcollectionviewCell: UICollectionViewCell {
    
    static let identifier = "searchcollectionviewCell"
    
    public let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.image = UIImage(named: "Facebook")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    public let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.backgroundColor = .systemGray6
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
    
    public let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.text = "06h"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    public let caleryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "$4500/m"
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
    
    
    var bHeart: Bool = false
    
    @objc private func didTapHeart() {
        bHeart = !bHeart
        if bHeart {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.layer.cornerRadius = 12
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .tertiarySystemBackground 
        contentView.addSubview(imageView)
        contentView.addSubview(heartButton)
        contentView.addSubview(companyLabel)
        contentView.addSubview(jobTypeLabel)
        contentView.addSubview(caleryLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(timeLabel)
        heartButton.layer.cornerRadius = 14
        heartButton.addTarget(self, action: #selector(didTapHeart), for: .touchUpInside)
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
            
            caleryLabel.topAnchor.constraint(equalTo: jobTypeLabel.bottomAnchor, constant: 12),
            caleryLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            caleryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21),
            
            locationLabel.topAnchor.constraint(equalTo: jobTypeLabel.bottomAnchor, constant: 12),
            locationLabel.leadingAnchor.constraint(equalTo: caleryLabel.trailingAnchor, constant: 10),
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21),
            
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21),
            
            heartButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            heartButton.heightAnchor.constraint(equalToConstant: 28),
            heartButton.widthAnchor.constraint(equalToConstant: 28),
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
