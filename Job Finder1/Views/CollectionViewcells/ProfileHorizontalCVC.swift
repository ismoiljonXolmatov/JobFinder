//
//  ProfileHorizontalCVC.swift
//  Job Finder1
//
//  Created by Apple on 20.08.1444 (AH).
//

import UIKit

class ProfileHorizontalCVC: UICollectionViewCell {

    static let identifier = "ProfileHorizontalCVC"
    
    public var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "google 1")
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .center
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
        label.text = "$2500/m"
        label.textColor = .label
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    public var googleLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "poppins", size: 12)
        label.textColor = .gray
        label.text = "Google"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    public var  locationLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "poppins", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Toronto, Canada"

        label.textColor = .gray
        return label
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .red
        return button
    }()

    var bHeart: Bool = false
    
  @objc private func didTapHeartButton() {
        bHeart = !bHeart
        if bHeart {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(heartButton)
        contentView.addSubview(jobLabel)
        contentView.addSubview(googleLb)
        contentView.addSubview(seleryLb)
        contentView.addSubview(locationLb)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .tertiarySystemBackground
        heartButton.addTarget(self, action: #selector(didTapHeartButton), for: .touchUpInside)
        addConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imageView.heightAnchor.constraint(equalToConstant: 44),
            imageView.widthAnchor.constraint(equalToConstant: 44),

            googleLb.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            googleLb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            
            
            jobLabel.topAnchor.constraint(equalTo: googleLb.bottomAnchor, constant: 20),
            jobLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            seleryLb.topAnchor.constraint(equalTo: jobLabel.bottomAnchor, constant: 16),
            seleryLb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            locationLb.topAnchor.constraint(equalTo: jobLabel.bottomAnchor, constant: 16),
            locationLb.leadingAnchor.constraint(equalTo: seleryLb.trailingAnchor, constant: 4),
            
            heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            heartButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25.5),
            heartButton.heightAnchor.constraint(equalToConstant: 25),
            heartButton.widthAnchor.constraint(equalToConstant: 25)
            
        ])
    }
    
}
