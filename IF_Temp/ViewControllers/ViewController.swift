//
//  ViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //AuthorizeHealthKit
        HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
          
          guard authorized else {
            
            let baseMessage = "HealthKit Authorization Failed"
            
            if let error = error {
              print("\(baseMessage). Reason: \(error.localizedDescription)")
            } else {
              print(baseMessage)
            }
            
            return
          }
          
          print("HealthKit Successfully Authorized.")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        PostLastOne.postLastOne()
        
        //if not login
        if((UserPersonalProfile.getUserName()) == nil || UserPersonalProfile.getUserName() == ""){
            
            print("You need Login!")
            
            //go to login page
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
            self.present(loginVC, animated: true)
            
        }
        
        else{
            //go to main
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewController")
               
            self.present(mainVC, animated: false, completion: nil)
        }
    }
    



}

