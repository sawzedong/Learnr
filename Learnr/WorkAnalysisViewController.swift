//
//  WorkAnalysisViewController.swift
//  Learnr
//
//  Created by Apple on 20/9/20.
//  Copyright © 2020 Techiaki. All rights reserved.
//

import UIKit

class WorkAnalysisViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

//MARK: -Pie chart setup

/*
let surface = SCIPieChartSurface()
surface.translatesAutoresizingMaskIntoConstraints = true
surface.frame = bounds
surface.autoresizingMask = [.flexibleHeight, .flexibleWidth]
self.addSubview(surface)

let pieSeries = SCIPieRenderableSeries()

// Adding pie segment
let segment = SCIPieSegment()
segment.fillStyle = SCIRadialGradientBrushStyle.init(colorCodeStart: 0xff84BC3D, finish: 0xff5B8829)
segment.value = 100.0
segment.title = "Segment"

pieSeries.segments.add(segment)

// add the SCIPieRenderableSeries to the SCIPieChartSurface
surface.renderableSeries.add(pieSeries)
*/
