//
//  NotificationTableViewCell.swift
//  Job Finder1
//
//  Created by Bismillah on 11.09.1444 (AH).
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    
    static let identifier = "NotificationTableViewCell"
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
       return UIColor(
           red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
           green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
           blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
           alpha: CGFloat(1.0)
       )
   }
    
    let switchButton: UISwitch = {
        let bt = UISwitch()
        bt.isOn = true
        bt.onTintColor = UIColorFromRGB(rgbValue: 0x291150)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
      let bigLb: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Poppins-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 1
        return label
        
    }()
    
      let littleLb: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Poppins-regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bigLb)
       contentView.addSubview(switchButton)
        contentView.addSubview(littleLb)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            bigLb.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            bigLb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            littleLb.topAnchor.constraint(equalTo: bigLb.bottomAnchor, constant: 3),
            littleLb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            switchButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            switchButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
