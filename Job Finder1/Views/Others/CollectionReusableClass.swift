//
//  CollectionReusableClass.swift
//  Job Finder1
//
//  Created by Apple on 19.08.1444 (AH).
//

import UIKit

class MyHeaderFooterClass: UICollectionReusableView {
    
    let titleLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purple
    
        // Customize here
        addSubview(titleLabel)
        print("MyHeaderFooterClass")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.sizeToFit()
        titleLabel.frame.origin = CGPoint(x: 15, y: 10)
    }
    
}
