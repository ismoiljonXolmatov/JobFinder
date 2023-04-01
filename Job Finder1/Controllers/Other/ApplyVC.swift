//
//  ApplyVC.swift
//  Job Finder1
//
//  Created by Apple on 22.08.1444 (AH).
//

import UIKit

class ApplyVC: UIViewController {
    
    
     let companyIamgeView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        return imageView
    }()
    
     let jobLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .label
        label.textAlignment = .center
        return label
    }()
    
     let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Medium", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .label
        return label
    }()
    
    private func UIColorFromRGB(rgbValue: UInt) -> UIColor {
       return UIColor(
           red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
           green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
           blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
           alpha: CGFloat(1.0)
       )
   }
    
    @IBOutlet var company: myButton!
    
    @IBOutlet var review: myButton!
    
    var changeColor: Bool = false
    
  @objc private func didTapUselessBt() {
        changeColor = !changeColor
        if changeColor {
            company.backgroundColor = UIColorFromRGB(rgbValue: 0x291150)
            company.titleLabel?.tintColor = UIColorFromRGB(rgbValue: 0xFFFFFF)
            
        } else {
            company.backgroundColor = UIColorFromRGB(rgbValue: 0xFFFFFF)
            company.titleLabel?.tintColor = UIColorFromRGB(rgbValue: 0x291150)
        }
    }
    
    @objc private func didTapUselessBt1() {
          changeColor = !changeColor
          if changeColor {
              review.backgroundColor = UIColorFromRGB(rgbValue: 0x291150)
              review.titleLabel?.tintColor = UIColorFromRGB(rgbValue: 0xFFFFFF)
              
          } else {
              review.backgroundColor = UIColorFromRGB(rgbValue: 0xFFFFFF)
              review.titleLabel?.tintColor = UIColorFromRGB(rgbValue: 0x291150)
          }
      }
     
    @IBAction func companyBt(_ sender: Any) {
        didTapUselessBt()
    }
    
    @IBAction func reviewBt(_ sender: Any) {
        didTapUselessBt1()
    }
    
    @IBAction func backButton(_ sender: Any) {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func applyButton(_ sender: Any) {
        let vc = FormViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .label
        let button1 = UIBarButtonItem(image: UIImage(named: "Group"), style: .plain, target: self, action: #selector(didTapCancel))
        self.navigationItem.leftBarButtonItem  = button1
        title = "Job Apply"
        navigationItem.largeTitleDisplayMode = .never
        addConstraint()
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
    
    private func addConstraint() {
        view.addSubview(companyIamgeView)
        view.addSubview(jobLabel)
        view.addSubview(companyLabel)
        companyIamgeView.layer.cornerRadius = 20
        companyIamgeView.frame = CGRect(x: 172, y: 130, width: 80, height: 80)
        NSLayoutConstraint.activate([
            companyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 191),
            companyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 85),
            
            jobLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            jobLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    @objc func didTapCancel() {
        self.navigationController?.popViewController(animated: true)
    }
}

@IBDesignable class myImageView: UIButton{}
extension myImageView {
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

