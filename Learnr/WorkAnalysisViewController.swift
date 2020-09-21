//
//  WorkAnalysisViewController.swift
//  Learnr
//
//  Created by Apple on 20/9/20.
//  Copyright © 2020 Techiaki. All rights reserved.
//

import UIKit
import PieCharts

class WorkAnalysisViewController: UIViewController {

//    MARK: - Pie Chart Setup
//    https://github.com/i-schuetz/PieCharts
    @IBOutlet weak var chartView: PieChart!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // placeholder data from documentation
        chartView.models = [
            PieSliceModel(value: 2.1, color: UIColor.yellow),
            PieSliceModel(value: 3, color: UIColor.blue),
            PieSliceModel(value: 1, color: UIColor.green)
        ]
        
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




