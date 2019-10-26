//
//  LoginViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var submitStatusLabel: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

        // Do any additional setup after loading the view.
        submitButton.isEnabled = false
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        if let username = usernameTextField.text {
            //UserPersonalProfile.setUserName(name: username)
            
            //go to main
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewController") as! MainViewController
            
            self.present(mainVC, animated: false, completion: nil)
        }
        
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(usernameTextField.text == nil || usernameTextField.text == ""){
            submitStatusLabel.text = "Can not username is empty."
            submitStatusLabel.textColor = UIColor.red
            submitButton.isEnabled = false
        }
        
        else{
            submitStatusLabel.text = "You can use this name."
            submitStatusLabel.textColor = UIColor.green
            submitButton.isEnabled = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
