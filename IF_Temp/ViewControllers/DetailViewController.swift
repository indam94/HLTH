//
//  DetailViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class DetailCardViewCell: UITableViewCell{
    @IBOutlet weak var outsideCardView: DetailCardView!
    
    @IBOutlet weak var insideCardView: UIView!
    
    @IBOutlet weak var riskAmount: UILabel!
    
    @IBOutlet weak var riskType: UILabel!
    
    @IBOutlet weak var riskLabel: UILabel!
}

class DetailTableViewCell: UITableViewCell{
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
}

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var detailTableView: UITableView!
    
    let riskData = [
        ["type":"Cancer", "amount":"10", "label":"???"],
        ["type":"Cancer", "amount":"5", "label":"???"],
        ["type":"Cancer", "amount":"1", "label":"???"],
        ["type":"Cancer", "amount":"10", "label":"???"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Your Risk"
        }
        else{
            return "Description"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 4
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! DetailCardViewCell
                    
            let riskAmount = riskData[indexPath.row]["amount"]
            
            cell.riskType.text = riskData[indexPath.row]["type"]
            cell.riskAmount.text = riskAmount
            cell.riskLabel.text = riskData[indexPath.row]["label"]
            
            switch riskAmount! {
            case "1","2","3":
                cell.outsideCardView.color = UIColor(named: "Safe")
            case "4","5","6","7":
                cell.outsideCardView.color = UIColor(named:"Middle")
                print("Middle")
            case "8","9","10":
                cell.outsideCardView.color = UIColor(named:"Risk")
                print("Risk")
            default:
                cell.outsideCardView.color = UIColor(named:"Safe")
            }
            cell.insideCardView.layer.cornerRadius = 10
                    
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DetailTableViewCell
        
//        cell.descriptionTextView.text =
        
        return cell
        
    }
    @IBAction func onClickInput(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
