//
//  InputTableViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/27/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class InputTableViewController: UITableViewController, UITextFieldDelegate {

    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var stepsTextField: UITextField!
    
    @IBOutlet weak var address1TextField: UITextField!
    
    @IBOutlet weak var address2TextField: UITextField!
    
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
                }
                
                
                
            }else{
                print("You Can not Save")
            }
            
        }
        
        //get HealthKit
        if(indexPath.section == 6){
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}
