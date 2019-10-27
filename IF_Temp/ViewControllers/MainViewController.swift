//
//  MainViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit
import Charts

extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var travelView: UIView!
    
    @IBOutlet weak var helloUser: UILabel!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var userStatusView: UIView!
    
    @IBOutlet weak var bloodPressureView: UIView!
    
    @IBOutlet weak var userSyncView: UIView!
    
    @IBOutlet weak var bmiStatusLabel: UILabel!
    
    @IBOutlet weak var travelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userName = UserPersonalProfile.getUserName(){
         
            helloUser.text = "Hello!\n\(userName)"
            
        }
        //self.view.layer.backgroundColor = UIColor.green.cgColor

        profileImg.layer.cornerRadius = profileImg.frame.size.width/2
        profileImg.clipsToBounds = true
        
        
        profileImg.layer.borderColor = UIColor.gray.cgColor
        profileImg.layer.borderWidth = 1.0
        
        userStatusView.layer.cornerRadius = 10
        
        
        bloodPressureView.layer.cornerRadius = 10
        
        bloodPressureView.layer.shadowColor = UIColor.black.cgColor
        
        bloodPressureView.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        let shadowPath = UIBezierPath(roundedRect: bloodPressureView.bounds, cornerRadius: 10)
        
        bloodPressureView.layer.shadowPath = shadowPath.cgPath
        
        bloodPressureView.layer.shadowOpacity = 0.2
        
        userSyncView.layer.cornerRadius = 10
        
        userSyncView.layer.shadowColor = UIColor.black.cgColor
        
        userSyncView.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        let shadowPath2 = UIBezierPath(roundedRect: userSyncView.bounds, cornerRadius: 10)
        
        userSyncView.layer.shadowPath = shadowPath2.cgPath
        
        userSyncView.layer.shadowOpacity = 0.2
        
        travelView.layer.cornerRadius = 10
    }
    override func viewDidAppear(_ animated: Bool) {
        
        //print(Int(UserPersonalProfile.getUserSyncTimeToken()!)!)
        print(Date().millisecondsSince1970)
        //PostToken.postToken()
        if(UserPersonalProfile.getUserSyncTimeToken() == nil || UserPersonalProfile.getUserSyncTimeToken() == "" || Int(UserPersonalProfile.getUserSyncTimeToken()!)! < Date().millisecondsSince1970/1000){
            
            PostToken.postToken()
        }
        
        if(UserPersonalProfile.getUserBMI() != nil && UserPersonalProfile.getUserBMI() != 0){
            let bmi = UserPersonalProfile.getUserBMI()!
            if(bmi > 20 && bmi < 25){
                userStatusView.layer.backgroundColor = UIColor(named: "Safe")?.cgColor
                bmiStatusLabel.text = "Healthy"
            }
            else if((bmi > 15 && bmi <= 20)||(bmi >= 25 && bmi < 30)){
                userStatusView.layer.backgroundColor = UIColor(named: "Middle")?.cgColor
                bmiStatusLabel.text = "Not Good"
            }
            else{
                userStatusView.layer.backgroundColor = UIColor(named: "Risk")?.cgColor
                bmiStatusLabel.text = "Danger"
            }
        }else{
            userStatusView.layer.backgroundColor = UIColor(named: "Safe")?.cgColor
        }
        
        if(UserPersonalProfile.getUserTravelTime() != nil && UserPersonalProfile.getUserTravelTime() != 0){
            let bmi = UserPersonalProfile.getUserTravelTime()!
            if(bmi < 30){
                travelView.layer.backgroundColor = UIColor(named: "Safe")?.cgColor
                travelLabel.text = "Good"
            }
            else if(bmi < 60 && bmi > 30){
                travelView.layer.backgroundColor = UIColor(named: "Middle")?.cgColor
                travelLabel.text = "Not Good"
            }
            else{
                travelView.layer.backgroundColor = UIColor(named: "Risk")?.cgColor
                travelLabel.text = "Bad"
            }
        }else{
            travelView.layer.backgroundColor = UIColor(named: "Safe")?.cgColor
        }
        
    }
}
