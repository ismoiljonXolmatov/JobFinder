//
//  SetFiltersVC.swift
//  Job Finder1
//
//  Created by Apple on 22.08.1444 (AH).
//

import UIKit

class SetFiltersVC: UIViewController {
    
//MARK: - Outlets
    
    @IBOutlet var categoryTextField: myTextfield!
    
    @IBOutlet var subCategoryTextField: myTextfield!
    
    @IBOutlet var locationTextField: DesignableUITextField!
    
    @IBOutlet var saleryTextField: DesignableUITextField!
    
    //MARK: - Datas
    
    let categories = ["UI/UX Design", "Software developer", "Computer network architects","Computer support specialists","IT project managers","Web developers","Information security analysts","Database administrators and architects"]
    
    let subCategories = ["Graphics Design", "Interaction design", "Visual design","Computer support specialists","Information architecture","Full-stack web development","Web designer","Content developer","Webmaster"]
    
    let locations = ["Canada","United States","Uzbekistan", "Netherlands", "Hungary","Armenia","Saudi Arabia","Kyrgyzstan","Romania","Azerbaijan","France"]
    
    let saleries = ["$1k-$2k", "$2k-$3k", "$3k-$5k","$6k-$7k"]
    

    //MARK: - PickerViews
    
    let categoryPickerView = UIPickerView()
    
    let subCategoryPickerView = UIPickerView()
    
    let locationPickerView = UIPickerView()
    
    let saleryPickerView = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickers()
        title = "Set Filters"
        navigationItem.largeTitleDisplayMode = .never
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapCancel))
        self.navigationItem.leftBarButtonItem  = button1
        navigationItem.leftBarButtonItem?.tintColor = .label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPickerView))
        view.addGestureRecognizer(tapGesture)

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

    
    
    
    
    @objc func dismissPickerView() {
        categoryTextField.resignFirstResponder()
        subCategoryTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        saleryTextField.resignFirstResponder()
    }
    
    private func configurePickers() {
        categoryPickerView.dataSource = self
        subCategoryPickerView.dataSource = self
        locationPickerView.dataSource = self
        saleryPickerView.dataSource = self
        subCategoryPickerView.delegate = self
        categoryPickerView.delegate = self
        locationPickerView.delegate = self
        saleryPickerView.delegate = self
        
        //MARK: - inputViews
        categoryTextField.inputView = categoryPickerView
        subCategoryTextField.inputView = subCategoryPickerView
        locationTextField.inputView = locationPickerView
        saleryTextField.inputView = saleryPickerView
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
            let customleftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 54))
            let imageView = UIImageView()
            imageView.frame = customleftView.bounds
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
extension SetFiltersVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPickerView {
            return categories.count
        } else if pickerView == subCategoryPickerView {
            return subCategories.count
        }
        else if pickerView == locationPickerView {
            return locations.count
        }
        else if pickerView == saleryPickerView {
            return saleries.count
        }
        else {
            return 0
        }
        
        }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPickerView {
            return categories[row]
        } else if pickerView == subCategoryPickerView {
            return subCategories[row]
        }
        else if pickerView == locationPickerView {
            return locations[row]
        }
        else if pickerView == saleryPickerView {
            return saleries[row]
        }
        else {
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPickerView {
            categoryTextField.text = categories[row]
        } else if pickerView == subCategoryPickerView {
            subCategoryTextField.text =  subCategories[row]
        }
        else if pickerView == locationPickerView {
            locationTextField.text =  locations[row]
        }
        else if pickerView == saleryPickerView {
            saleryTextField.text =  saleries[row]
        }
    }
    }
    
