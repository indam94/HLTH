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
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.section == 5){

            if let weight = weightTextField.text, let height = heightTextField.text, let steps = stepsTextField.text, let address1 = address1TextField.text, let address2 = address2TextField.text{
                
                if(weight != "" && height != "" && steps != "" && address1 != "" && address2 != ""){
                    
                    
                    
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
        
        //get HealthKit
        if(indexPath.section == 6){
            loadAndDisplayMostRecentWeight()
            loadAndDisplayMostRecentHeight()
            loadAndDisplayTodaySteps()
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
          
          let weightInKilograms = sample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
            self.weightTextField.text = "\(weightInKilograms) kg"
            self.inputDataSet["weight"] = "\(weightInKilograms)"
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
    
}
