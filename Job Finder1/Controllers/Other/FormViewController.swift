//
//  FormViewController.swift
//  Job Finder1
//
//  Created by Apple on 24.08.1444 (AH).
//

import UIKit

class FormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapCancel))
        self.navigationItem.leftBarButtonItem  = button1
        title = "Job Apply"
        navigationItem.largeTitleDisplayMode = .never

    }
    @objc func didTapCancel() {
        self.navigationController?.popViewController(animated: true)
    }

}
@IBDesignable class myTextfield: UITextField{}
extension myTextfield {
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
