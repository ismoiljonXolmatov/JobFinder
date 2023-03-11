//
//  Sizes.swift
//  Job Finder1
//
//  Created by Apple on 19.08.1444 (AH).
//

import UIKit


extension UIView {
    public var width: CGFloat {
        return self.frame.size.width
    }
    public var height: CGFloat {
        return self.frame.size.height
    }
    public var top: CGFloat {
        return self.frame.origin.y
    }
    public var bottom: CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }
    public var leading: CGFloat {
        return self.frame.origin.x
    }
    public var traling: CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }
}

