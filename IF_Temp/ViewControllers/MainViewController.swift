//
//  MainViewController.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit
import Charts

class MainViewController: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var helloUser: UILabel!
    
    //Temp Chart Data
    var tempData1 = PieChartDataEntry(value: 0)
    var tempData2 = PieChartDataEntry(value: 0)
    
    var numberOfDownloadDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let username: String? = UserPersonalProfile.getUserName()
        helloUser.text = "Hello, \(username ?? "Unknown")!"

        // Do any additional setup after loading the view.
        
        pieChart.chartDescription?.text? = "Main Chart Description"
        
        tempData1.value = 50
        tempData1.label = "temp1"
        
        tempData2.value = 50
        tempData2.label = "temp2"
        
        numberOfDownloadDataEntries = [tempData1, tempData2]
        
        updateMainChartData()
    }
    
    func updateMainChartData(){
        
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named: "main"), UIColor(named: "secondary")]
        
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
    }

}
