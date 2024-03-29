//
//  InputTableViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/27/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit
import HealthKit

class InputTableViewController: UITableViewController, UITextFieldDelegate {

    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var stepsTextField: UITextField!
    
    @IBOutlet weak var address1TextField: UITextField!
    
    @IBOutlet weak var address2TextField: UITextField!
    
    var inputDataSet : [String: Any] = ["weight":"","height":"","steps":"","address1":"","address2":""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = .none
        
        self.tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        self.tableView.keyboardDismissMode = .onDrag
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.displaySuccessAlert), name: NOTIFICATION_SET_USER_INFO, object: nil)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.section == 5){
            
            let alert = UIAlertController(title: "Inform",
                                          message: "By using this app, you consent to our use and disclosure of your protected healthcare information. You have the right to revoke this consent in writing, signed by you. However, such a revocation will not be retroactive.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler:
                {
                    action in
                    self.pushInfo()
            }
            ))
            alert.addAction(UIAlertAction(title: "Cancel",
            style: .cancel,
            handler: nil))
            present(alert, animated: true, completion: nil)

            
            
        }
        
        //get HealthKit
        if(indexPath.section == 6){
            loadAndDisplayMostRecentWeight()
            loadAndDisplayMostRecentHeight()
            loadAndDisplayTodaySteps()
        }
        
    }
    
    private func pushInfo(){
        if let weight = weightTextField.text, let height = heightTextField.text, let steps = stepsTextField.text, let address1 = address1TextField.text, let address2 = address2TextField.text{
            
            if(weight != "" && height != "" && steps != "" && address1 != "" && address2 != ""){
                
                UserPersonalProfile.setUserAddress1(name: address1)
                UserPersonalProfile.setUserAddress2(name: address2)
                PostAddress.postAddress()
                PostAddress1.postAddress1()
                
                PostWeight.postWeight()
                PostBMI.postBMI()
                //            PostNetwork.PostNetWorkSendInput()
                
                print("You Save : \(weight)")
            }else{
                 print("You Can not Save")
                self.showToast(message: "Item not entered exists", font: .boldSystemFont(ofSize: 15))
            }
            
            
            
        }else{
            self.showToast(message: "Item not entered exists", font: .boldSystemFont(ofSize: 15))
        }
    }
    
    private func loadAndDisplayMostRecentWeight(){
        
        guard let weightSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else {
          print("Body Mass Sample Type is no longer available in HealthKit")
          return
        }
        
        ProfileDataStore.getMostRecentSample(for: weightSampleType) { (sample, error) in
          guard let sample = sample else {
            if let error = error {
              self.displayAlert(for: error)
            }
            return
          }
          
            let weightInKilograms = sample.quantity.doubleValue(for: HKUnit.pound())
            self.weightTextField.text = "\(weightInKilograms) lb"
            self.inputDataSet["weight"] = "\(weightInKilograms)"
            
            UserPersonalProfile.setUserWeight(name: weightInKilograms)
        }
        
    }
    
    private func loadAndDisplayMostRecentHeight(){
        
        //1. Use HealthKit to create the Height Sample Type
        guard let heightSampleType = HKSampleType.quantityType(forIdentifier: .height) else {
          print("Height Sample Type is no longer available in HealthKit")
          return
        }
        
        ProfileDataStore.getMostRecentSample(for: heightSampleType) { (sample, error) in
          guard let sample = sample else {
            if let error = error {
              self.displayAlert(for: error)
            }
            
            return
          }
          
          //2. Convert the height sample to meters, save to the profile model,
          //   and update the user interface.
            let heightInMeters = sample.quantity.doubleValue(for: HKUnit.meterUnit(with: .centi))
            self.heightTextField.text = "\(heightInMeters) cm"
            self.inputDataSet["height"] = "\(heightInMeters)"
            
            UserPersonalProfile.setUserHeight(name: heightInMeters/100.0)
        }
        
    }
    
    private func loadAndDisplayTodaySteps(){
        
        //1. Use HealthKit to create the Height Sample Type
        guard let heightSampleType = HKSampleType.quantityType(forIdentifier: .stepCount) else {
          print("Height Sample Type is no longer available in HealthKit")
          return
        }
        
        ProfileDataStore.getMostRecentSample(for: heightSampleType) { (sample, error) in
          guard let sample = sample else {
            if let error = error {
              self.displayAlert(for: error)
            }
            
            return
          }
          
          //2. Convert the height sample to meters, save to the profile model,
          //   and update the user interface.
            let stepCounter = sample.quantity.doubleValue(for: HKUnit.count())
            self.stepsTextField.text = "\(stepCounter) steps"
            self.inputDataSet["steps"] = "\(stepCounter)"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    private func displayAlert(for error: Error) {
      let alert = UIAlertController(title: nil,
                                    message: error.localizedDescription,
                                    preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "O.K.",
                                    style: .default,
                                    handler: nil))
      present(alert, animated: true, completion: nil)
    }
    
    @objc func displaySuccessAlert(){
        let alert = UIAlertController(title: "Connect",
                                      message: "Success!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "O.K.",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
