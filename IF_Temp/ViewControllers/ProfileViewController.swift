//
//  ProfileViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

extension UITableViewCell{
func shadowAndBorderForCell(yourTableViewCell : UITableViewCell){
// SHADOW AND BORDER FOR CELL
//yourTableViewCell.contentView.layer.cornerRadius = 5
yourTableViewCell.contentView.layer.borderWidth = 0.5
yourTableViewCell.contentView.layer.borderColor = UIColor.lightGray.cgColor
yourTableViewCell.contentView.layer.masksToBounds = true
yourTableViewCell.layer.shadowColor = UIColor.gray.cgColor
yourTableViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
yourTableViewCell.layer.shadowRadius = 2.0
yourTableViewCell.layer.shadowOpacity = 1.0
yourTableViewCell.layer.masksToBounds = false
yourTableViewCell.layer.shadowPath = UIBezierPath(roundedRect:yourTableViewCell.bounds, cornerRadius:yourTableViewCell.contentView.layer.cornerRadius).cgPath
}
}

class ProfileViewController: UITableViewController {

    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var sexLabel: UILabel!
    
    @IBOutlet weak var bloodtypeLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var BMILabel: UILabel!
    
    
    private enum ProfileSection: Int {
      case ageSexBloodType
      case weightHeightBMI
      case readHealthKitData
      case saveBMI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setInitialInfo()
    }
    
    func setInitialInfo(){
        
    }

}
