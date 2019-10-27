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
    
    func setLayout(){
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 335, height: 48)
        label.backgroundColor = .white
        label.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 335).isActive = true
        label.heightAnchor.constraint(equalToConstant: 48).isActive = true
        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 431).isActive = true
        
        let label1 = UILabel()
        label1.frame = CGRect(x: 0, y: 0, width: 335, height: 48)
        label1.backgroundColor = .white
        label1.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        self.view.addSubview(label1)
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.widthAnchor.constraint(equalToConstant: 335).isActive = true
        label1.heightAnchor.constraint(equalToConstant: 48).isActive = true
        label1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
        label1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 333).isActive = true
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 0, y: 0, width: 335, height: 48)
        label2.backgroundColor = .white
        label2.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        self.view.addSubview(label2)
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.widthAnchor.constraint(equalToConstant: 335).isActive = true
        label2.heightAnchor.constraint(equalToConstant: 48).isActive = true
        label2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17).isActive = true
        label2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 529).isActive = true
        
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        let userName = usernameTextField.text
        let password = passwordTextField.text
        
        if(userName != "" && password != ""){
            PostNetwork.PostNetWorkRequestLogin(userName: userName!, password: password!)
        }
        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let userName = usernameTextField.text
        let password = passwordTextField.text
        
        if(userName != "" && password != ""){
            PostNetwork.PostNetWorkRequestSignup(userName: userName!, password: password!)
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
