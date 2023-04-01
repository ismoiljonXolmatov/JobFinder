//
//  NotificationsViewController.swift
//  Job Finder1
//
//  Created by Bismillah on 11.09.1444 (AH).
//

import UIKit

class NotificationsViewController: UIViewController {

    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
       return UIColor(
           red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
           green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
           blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
           alpha: CGFloat(1.0)
       )
   }
    
    private let switchButton: UISwitch = {
        let bt = UISwitch()
        bt.isOn = true
        bt.onTintColor = UIColorFromRGB(rgbValue: 0x291150)
        return bt
    }()
    
     private let bigLb: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Poppins-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 1
        return label
        
    }()
    
     private let littleLb: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Poppins-regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
         
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bigLb)
        view.addSubview(switchButton)
        view.addSubview(littleLb)
        addConstraints()
    }
   

}
