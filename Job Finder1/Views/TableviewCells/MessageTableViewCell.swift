//
//  MessageTableViewCell.swift
//  Job Finder1
//
//  Created by Apple on 24.08.1444 (AH).
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    public var userProfileImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "Avatar")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = imageview.height/2
        return imageview
    }()
    
    public var unreadNumberIMV: UIImageView = {
        let imageview = UIImageView()
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "Avatar7")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = imageview.height/2
        return imageview
    }()
    
    
    public var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Abdulloh"
        label.font = UIFont(name: "poppins", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 1
        return label
        
    }()
    
    public var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "poppins", size: 14)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "Qalesan"
        label.numberOfLines = 1
        return label
    }()
    
    static let identifier = "MessageTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userProfileImageView)
        contentView.addSubview(unreadNumberIMV)
        contentView.addSubview(nameLabel)
        contentView.addSubview(messageLabel)
        addConstraint()
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            userProfileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userProfileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 50),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 50),
            
            
            messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            messageLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 15),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            
            
            unreadNumberIMV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            unreadNumberIMV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            unreadNumberIMV.heightAnchor.constraint(equalToConstant: 24),
            unreadNumberIMV.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
