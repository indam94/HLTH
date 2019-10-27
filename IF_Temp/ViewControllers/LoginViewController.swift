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
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var signContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        signContainer.layer.cornerRadius = 10
        
        usernameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

        // Do any additional setup after loading the view.
        submitButton.isEnabled = false
        signupButton.isEnabled = false

        NotificationCenter.default.addObserver(self, selector: #selector(self.setLoginInfoByNotification), name: NOTIFICATION_SET_USER_INFO, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.setLoginInfoFailByNotification), name: NOTIFICATION_SET_USER_INFO_FAIL, object: nil)
        
        //setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showToast(message: "Move to Login Page", font: .boldSystemFont(ofSize: 15))
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        //let userName = usernameTextField.text
        let password = passwordTextField.text
        
        
        if let username = usernameTextField.text {
            UserPersonalProfile.setUserName(name: username)
            
            //go to main
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewController")
            
            self.present(mainVC, animated: false, completion: nil)
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        //let userName = usernameTextField.text
        let password = passwordTextField.text
        
        if let username = usernameTextField.text {
            UserPersonalProfile.setUserName(name: username)
            
            //go to main
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewController")
            
            self.present(mainVC, animated: false, completion: nil)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(usernameTextField.text == nil || usernameTextField.text == "" || passwordTextField.text == nil || passwordTextField.text == ""){
            submitButton.isEnabled = false
            signupButton.isEnabled = false
        }
        
        else{
            submitButton.isEnabled = true
            signupButton.isEnabled = true
        }
    }
    
    @objc func setLoginInfoByNotification(noti: Notification){
        if let username = usernameTextField.text {
            UserPersonalProfile.setUserName(name: username)
            
            //go to main
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewController")
            
            self.present(mainVC, animated: false, completion: nil)
        }
    }
    
    @objc func setLoginInfoFailByNotification(noti: Notification){
        if let username = usernameTextField.text {
            UserPersonalProfile.setUserName(name: username)
            
            self.showToast(message: "Failed", font: .boldSystemFont(ofSize: 15))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    

}
