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
    }

}
