//
//  DetailViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class DetailCardViewCell: UITableViewCell{
    @IBOutlet weak var outsideCardView: UIView!
    
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
                    
            //        cell.riskType.text =
            //        cell.riskAmount.text =
            //        cell.riskLabel.text =
                    cell.backgroundColor = UIColor(white: 1.0, alpha: 1)
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
