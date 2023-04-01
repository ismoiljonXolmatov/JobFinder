//
//  FormViewController.swift
//  Job Finder1
//
//  Created by Apple on 24.08.1444 (AH).
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet var countryTextField: myTextfield!
    
    let countries = ["Canada","United States","Uzbekistan", "Netherlands", "Hungary","Armenia","Saudi Arabia","Kyrgyzstan","Romania","Azerbaijan","France"]
 
    let countryPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTextField.inputView = countryPickerView
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapCancel))
        self.navigationItem.leftBarButtonItem  = button1
        title = "Job Apply"
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapDismiss))
        view.addGestureRecognizer(gesture)
        navigationItem.largeTitleDisplayMode = .never

    }
    
    @objc func didTapDismiss() {
        if countryTextField.isFirstResponder {
            countryTextField.resignFirstResponder()
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        setNeedsStatusBarAppearanceUpdate()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
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

extension FormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countries[row]
    }
    
}
