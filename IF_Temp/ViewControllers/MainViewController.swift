//
//  MainViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit
import Charts

class MainViewController: UIViewController {
    
    @IBOutlet weak var helloUser: UILabel!
    
    @IBOutlet weak var profileImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userName = UserPersonalProfile.getUserName(){
         
            helloUser.text = "Hello!\n\(userName)"
            
        }
        
        profileImg.layer.cornerRadius = 50
        
        setLayout()
    }

    func setLayout(){
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 170)
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 375).isActive = true
        view.heightAnchor.constraint(equalToConstant: 170).isActive = true
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true

        // Code confidentiel
        let view1 = UILabel()
        view1.frame = CGRect(x: 0, y: 0, width: 161, height: 92)
        view1.backgroundColor = .white
        view1.textColor = UIColor(red: 0.18, green: 0.2, blue: 0.21, alpha: 1)
        view1.font = UIFont(name: "Avenir-Black", size: 34)
        view1.numberOfLines = 0
        view1.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0

        // Line height: 41 pt
        view1.attributedText = NSMutableAttributedString(string: "Welcome Peter!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
         
        self.view.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.widthAnchor.constraint(equalToConstant: 161).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 92).isActive = true
        view1.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 20).isActive = true
        view1.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 64).isActive = true

        // Mask Group
        let view2 = UILabel()
        view2.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        view2.backgroundColor = .white
         
        let shadows = UIView()
        shadows.frame = view2.frame
        shadows.clipsToBounds = false
        view2.addSubview(shadows)
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 12
        layer0.shadowOffset = CGSize(width: 0, height: 6)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)
        view2.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        self.view.addSubview(view2)
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.widthAnchor.constraint(equalToConstant: 80).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view2.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 267).isActive = true
        view2.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 70).isActive = true

        // Code confidentiel
        let view3 = UILabel()
        view3.frame = CGRect(x: 0, y: 0, width: 211, height: 41)
        view3.backgroundColor = .white
           
        view3.textColor = UIColor(red: 0, green: 0.78, blue: 0.7, alpha: 1)
        view3.font = UIFont(name: "Avenir-Black", size: 34)
        let paragraphStyle1 = NSMutableParagraphStyle()
        paragraphStyle1.lineSpacing = 0
        // Line height: 41 pt
        // (identical to box height)
         
        view3.attributedText = NSMutableAttributedString(string: "Last Records", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        self.view.addSubview(view3)
        view3.translatesAutoresizingMaskIntoConstraints = false
        view3.widthAnchor.constraint(equalToConstant: 211).isActive = true
        view3.heightAnchor.constraint(equalToConstant: 41).isActive = true
        view3.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 20).isActive = true
        view3.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 194).isActive = true

        // Group 36.1
        let view4 = UILabel()
        view4.frame = CGRect(x: 0, y: 0, width: 160, height: 144)
        view4.backgroundColor = .white
           
        view4.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
         
         self.view.addSubview(view4)
        view4.translatesAutoresizingMaskIntoConstraints = false
        view4.widthAnchor.constraint(equalToConstant: 160).isActive = true
        view4.heightAnchor.constraint(equalToConstant: 144).isActive = true
        view4.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 195).isActive = true
        view4.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 255).isActive = true

        // Rectangle
        let view5 = UILabel()
        view5.frame = CGRect(x: 0, y: 0, width: 375, height: 179)
        view5.backgroundColor = .white
           
        view5.layer.backgroundColor = UIColor(red: 0.98, green: 0.99, blue: 0.99, alpha: 1).cgColor
         
         self.view.addSubview(view5)
        view5.translatesAutoresizingMaskIntoConstraints = false
        view5.widthAnchor.constraint(equalToConstant: 375).isActive = true
        view5.heightAnchor.constraint(equalToConstant: 179).isActive = true
        view5.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 0).isActive = true
        view5.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 633).isActive = true
        
        // Group 35
        let view6 = UILabel()
        view6.frame = CGRect(x: 0, y: 0, width: 160, height: 144)
        view6.backgroundColor = .white
           
        view6.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
           self.view.addSubview(view6)
        view6.translatesAutoresizingMaskIntoConstraints = false
        view6.widthAnchor.constraint(equalToConstant: 160).isActive = true
        view6.heightAnchor.constraint(equalToConstant: 144).isActive = true
        view6.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 21).isActive = true
        view6.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 255).isActive = true
         
        // Group 7.3
        let view7 = UILabel()
        view7.frame = CGRect(x: 0, y: 0, width: 337, height: 104)
        view7.backgroundColor = .white
        view7.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
         
        self.view.addSubview(view7)
        view7.translatesAutoresizingMaskIntoConstraints = false
        view7.widthAnchor.constraint(equalToConstant: 337).isActive = true
        view7.heightAnchor.constraint(equalToConstant: 104).isActive = true
        view7.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 18).isActive = true
        view7.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 562).isActive = true
        
        // Group
        let view8 = UILabel()
        view8.frame = CGRect(x: 0, y: 0, width: 375, height: 120)
        view8.backgroundColor = .white
        view8.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
         
         self.view.addSubview(view8)
        view8.translatesAutoresizingMaskIntoConstraints = false
        view8.widthAnchor.constraint(equalToConstant: 375).isActive = true
        view8.heightAnchor.constraint(equalToConstant: 120).isActive = true
        view8.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 0).isActive = true
        view8.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 692).isActive = true
        // #2
        let view9 = UILabel()
        view9.frame = CGRect(x: 0, y: 0, width: 93.63, height: 49)
        view9.backgroundColor = .white
        view9.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
         
        self.view.addSubview(view9)
        view9.translatesAutoresizingMaskIntoConstraints = false
        // UI Bars / Home Indicator / Home Indicator - On Light
        let view10 = UILabel()
        view10.frame = CGRect(x: 0, y: 0, width: 375, height: 34)
        view10.backgroundColor = .white
        view10.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
         
         self.view.addSubview(view10)
        view10.translatesAutoresizingMaskIntoConstraints = false
        view10.widthAnchor.constraint(equalToConstant: 375).isActive = true
        view10.heightAnchor.constraint(equalToConstant: 34).isActive = true
        view10.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 0).isActive = true
        view10.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 778).isActive = true
        // Frame 1
        let view11 = UILabel()
        view11.frame = CGRect(x: 0, y: 0, width: 100, height: 72)
        view11.backgroundColor = .white
        view11.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
         
        self.view.addSubview(view11)
        view11.translatesAutoresizingMaskIntoConstraints = false
        view11.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view11.heightAnchor.constraint(equalToConstant: 72).isActive = true
        view11.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 274).isActive = true
        view11.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 299).isActive = true
        
        // Icon/pulse
        let view12 = UILabel()
        view12.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view12.backgroundColor = .white
        view12.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
         
        self.view.addSubview(view12)
        view12.translatesAutoresizingMaskIntoConstraints = false
        view12.widthAnchor.constraint(equalToConstant: 30).isActive = true
        view12.heightAnchor.constraint(equalToConstant: 30).isActive = true
        view12.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor, constant: 38).isActive = true
        view12.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 274).isActive = true

        //Paste Group 7.3

    }
}
