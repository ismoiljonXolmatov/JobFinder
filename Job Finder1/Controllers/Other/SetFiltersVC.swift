//
//  SetFiltersVC.swift
//  Job Finder1
//
//  Created by Apple on 22.08.1444 (AH).
//

import UIKit

class SetFiltersVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Set Filters"
        navigationItem.largeTitleDisplayMode = .never
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapCancel))
        self.navigationItem.leftBarButtonItem  = button1
        navigationItem.rightBarButtonItem?.tintColor = .label
    }
    
    @objc func didTapCancel() {
        self.navigationController?.popViewController(animated: true)
    }
   
}

@IBDesignable class MyView: UIView {}
extension MyView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}

@IBDesignable class myButton: UIButton{}
extension myButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}


@IBDesignable class myImageV: UIImageView{}
extension myImageV {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
@IBDesignable
class DesignableUITextField: UITextField {
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let customleftView = UIView(frame: CGRect(x: 0, y: 0, width: 54, height: 54))
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 54, height: 54))
            imageView.contentMode = .center
            imageView.image = image
            customleftView.addSubview(imageView)
                 imageView.tintColor = color
            leftView = customleftView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
